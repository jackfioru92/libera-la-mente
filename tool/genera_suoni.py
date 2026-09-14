"""Genera i loop del mixer in assets/mixer/*.m4a (60 s, crossfade, mono, AAC 96 kbps).

    python3 tool/genera_suoni.py

Richiede numpy e afconvert (macOS). Suoni sintetizzati: nessun campione
esterno, nessun copyright. Seme fisso: output riproducibile.
"""
import numpy as np, wave, os, subprocess, tempfile
SR=44100; DUR=60; N=SR*DUR
rng=np.random.default_rng(7)
OUT='assets/mixer'

def normalize(x, peak=0.6):
    x=x-x.mean(); return x/np.max(np.abs(x))*peak

def loopable(x, fade=1.0):
    n=int(SR*fade); w=np.linspace(0,1,n); x=x.copy(); head=x[:n].copy(); tail=x[-n:]
    x[:n]=head*w+tail*(1-w); return x[:-n]

def lowpass(x, cutoff):
    a=np.exp(-2*np.pi*cutoff/SR); y=np.zeros_like(x); s=0.0
    for i in range(len(x)): s=a*s+(1-a)*x[i]; y[i]=s
    return y

def highpass(x, cutoff): return x-lowpass(x,cutoff)

def fft_color(white, exponent):
    X=np.fft.rfft(white); f=np.fft.rfftfreq(len(white),1/SR); f[0]=f[1]
    return np.fft.irfft(X/(f**(exponent/2)), n=len(white))

def build():
    white=rng.standard_normal(N); s={}
    s['bianco']=white; s['rosa']=fft_color(white,1.0); s['marrone']=fft_color(white,2.0)
    rain=highpass(fft_color(rng.standard_normal(N),0.8),1200); drops=np.zeros(N); t=np.arange(int(SR*0.03))/SR
    for _ in range(2200):
        p=rng.integers(0,N-len(t)); fr=rng.uniform(2500,6000); a=rng.uniform(0.05,0.35)
        drops[p:p+len(t)]+=a*np.sin(2*np.pi*fr*t)*np.exp(-t*220)
    s['pioggia']=rain*0.8+drops
    tt=np.arange(N)/SR; lfo=0.55+0.45*np.sin(2*np.pi*0.07*tt)*np.sin(2*np.pi*0.023*tt+1.3)
    s['vento']=lowpass(fft_color(rng.standard_normal(N),1.6),900)*lfo
    fire=lowpass(fft_color(rng.standard_normal(N),2.0),300)*0.9; crack=np.zeros(N)
    for _ in range(900):
        L=rng.integers(int(SR*0.004),int(SR*0.03)); p=rng.integers(0,N-L)
        crack[p:p+L]+=rng.uniform(0.1,0.9)*rng.standard_normal(L)*np.exp(-np.linspace(0,6,L))
    s['fuoco']=fire+highpass(crack,800)*0.6
    return s

if __name__=='__main__':
    os.makedirs(OUT, exist_ok=True)
    for name,x in build().items():
        y=loopable(normalize(x))
        with tempfile.NamedTemporaryFile(suffix='.wav', delete=False) as tmp: wav=tmp.name
        with wave.open(wav,'wb') as w:
            w.setnchannels(1); w.setsampwidth(2); w.setframerate(SR); w.writeframes((y*32767).astype(np.int16).tobytes())
        out=f'{OUT}/{name}.m4a'
        subprocess.run(['afconvert','-f','m4af','-d','aac','-b','96000',wav,out],check=True); os.unlink(wav)
        print(name, os.path.getsize(out)//1024,'KB')

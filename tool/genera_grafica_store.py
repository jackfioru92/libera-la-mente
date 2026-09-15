"""Rigenera store/icon-512.png e le feature graphic 1024x500 (IT/EN) dall'icona.

    python3 tool/genera_grafica_store.py

Usa assets/icon/icon.png (già senza pallino) e Helvetica Neue di macOS.
"""
from PIL import Image, ImageDraw, ImageFilter, ImageFont
W,H=1024,500
FONT='/System/Library/Fonts/HelveticaNeue.ttc'
def font(size, index): return ImageFont.truetype(FONT, size, index=index)
def lerp(a,b,t): return tuple(int(a[i]+(b[i]-a[i])*t) for i in range(3))

def background():
    im=Image.new('RGB',(W,H)); px=im.load()
    top=(0x14,0x12,0x2E); mid=(0x3A,0x2E,0x6E)
    for y in range(H):
        for x in range(W):
            px[x,y]=lerp(top,mid,(x/W*0.6+y/H*0.4))
    glow=Image.new('RGB',(W,H),(0,0,0))
    ImageDraw.Draw(glow).ellipse((-100,H*0.45,W*0.55,H*1.6),fill=(0xE9,0x8A,0x5A))
    glow=glow.filter(ImageFilter.GaussianBlur(120))
    return Image.blend(im, Image.composite(glow, im, glow.convert('L').point(lambda v: min(255,int(v*1.3)))), 0.7)

def rounded_icon(size):
    icon=Image.open('assets/icon/icon.png').convert('RGBA').resize((size,size), Image.LANCZOS)
    mask=Image.new('L',(size,size),0); ImageDraw.Draw(mask).rounded_rectangle((0,0,size-1,size-1),radius=int(size*0.225),fill=255)
    out=Image.new('RGBA',(size,size),(0,0,0,0)); out.paste(icon,(0,0),mask); return out

def feature(title, subtitle, tagline, out):
    im=background().convert('RGBA')
    # ombra + icona
    size=300; x,y=90,100
    shadow=Image.new('RGBA',(W,H),(0,0,0,0))
    ImageDraw.Draw(shadow).rounded_rectangle((x+8,y+16,x+size+8,y+size+16),radius=68,fill=(0,0,0,140))
    shadow=shadow.filter(ImageFilter.GaussianBlur(22)); im=Image.alpha_composite(im,shadow)
    im.paste(rounded_icon(size),(x,y),rounded_icon(size))
    d=ImageDraw.Draw(im)
    d.text((440,150), title, font=font(74,12), fill=(0xEE,0xEA,0xE2))
    d.text((442,246), subtitle, font=font(34,7), fill=(0xE9,0xB8,0x84))
    d.text((442,312), tagline, font=font(28,7), fill=(0x9A,0xA0,0xAA))
    im.convert('RGB').save(out, quality=95); print(out)

if __name__=='__main__':
    Image.open('assets/icon/icon.png').convert('RGB').resize((512,512), Image.LANCZOS).save('store/icon-512.png')
    feature('Libera la Mente','Respiro quadrato · Pillole · ASMR','Gratis, senza account, senza pubblicità','store/feature-graphic-1024x500.png')
    feature('Libera la Mente','Box breathing · Pills · ASMR','Free, no account, no ads','store/feature-graphic-1024x500-en.png')

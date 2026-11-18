# فایل نصبی EXE

**توسعه‌دهنده:** مهدی طریری — mahditariri@gmail.com

## کاربر نهایی

1. از GitHub **Releases** فایل `GGUF-Runner-Setup-1.0.0.exe` را دانلود کنید
2. اجرا کنید (معمولاً بدون Admin)
3. تیک «desktop icon» و «detect Windows / download llama-server» را بزنید
4. بعد از نصب، آیکون **GGUF Runner** روی دسکتاپ
5. مدل `.gguf` را در پوشه `models` بگذارید و آیکون را باز کنید

## تشخیص سیستم

اسکریپت `scripts\detect_and_setup.ps1`:

- Windows 7 / 8 / 10 / 11 (از Build Number)
- 32-bit یا 64-bit
- دانلود `llama-server` برای **x64**
- ساخت میانبر دسکتاپ با آیکون
- نصب pip packages اگر Python باشد

## ساخت EXE توسط GitHub

با push تگ `v1.0.0` ورک‌فلو **Build Setup EXE** اجرا می‌شود (Inno Setup روی windows-latest).

محلی:

1. نصب [Inno Setup 6](https://jrsoftware.org/isinfo.php)
2. باز کردن `installer\GGUF-Runner.iss`
3. Build → Compile
4. خروجی: `installer\Output\GGUF-Runner-Setup-1.0.0.exe`

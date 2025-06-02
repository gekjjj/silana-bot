# استخدم صورة Node.js
FROM node:lts-buster

# تثبيت الحزم المطلوبة
RUN apt-get update && \
    apt-get install -y \
        git \
        ffmpeg \
        imagemagick \
        webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# تعيين مجلد العمل
WORKDIR /app

# استنساخ المستودع (غيّر الرابط لرابط مستودعك الفعلي)
RUN git clone https://github.com/gekjjj/silana-bot.git

# الانتقال إلى مجلد المشروع داخل الحاوية
WORKDIR /app/silana-bot

# إعطاء صلاحيات وتثبيت الاعتماديات
RUN chmod -R 777 /app && \
    npm cache clean --force && \
    npm install --force

# تشغيل التطبيق
CMD ["npm", "start"]

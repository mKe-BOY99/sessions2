# Soti sou Node 20 slim pou minimize image size
FROM node:20-slim

# Mete non itilizatè
USER root

# Enstale depandans Debian
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    npm install -g yarn pm2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Klone repo a
RUN git clone https://github.com/mKe-BOY99/sessions2.git /home/node/sessions2

WORKDIR /home/node/sessions2

# Mete dwa sou dosye yo
RUN chmod -R 755 .

# Enstale depandans npm/yarn
RUN yarn install --network-concurrency 1

# Deklare pò
EXPOSE 3000

# Mete anviwònman
ENV NODE_ENV=production

# Kòmanse ak PM2 jan scripts yo mande
CMD ["pm2-runtime", "index.js", "--name", "gifted"]

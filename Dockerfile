FROM node:20-slim

USER root

# Enstale depandans esansyèl
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    npm install -g pm2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone repozitwa ou
RUN git clone https://github.com/mKe-BOY99/sessions2.git /home/node/sessions2

WORKDIR /home/node/sessions2

# Mete dwa sou fichye yo
RUN chmod -R 777 /home/node/sessions2/

# Enstale depandans ak yarn (li deja disponib)
RUN yarn install --network-concurrency 1

EXPOSE 3000
ENV NODE_ENV=production

# Kòmanse bot la
CMD ["npm", "start"]

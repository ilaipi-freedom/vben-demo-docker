# node 构建
FROM node:18-alpine
RUN npm install pnpm -g

# 署名
MAINTAINER ilaipi 'mz.yyam@gmail.com'

WORKDIR /app

# 设置 node 阿里镜像
# RUN npm config set registry https://registry.npmmirror.com
# 设置--max-old-space-size
ENV NODE_OPTIONS=--max-old-space-size=16384
ENV VITE_PORT=5173
# 设置阿里镜像、pnpm、依赖、编译
COPY . ./
RUN pnpm install --frozen-lockfile

EXPOSE 5173

CMD pnpm dev

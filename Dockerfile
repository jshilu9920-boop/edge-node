FROM alpine:3.19
RUN apk add --no-cache curl unzip ca-certificates
RUN curl -L -s https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip -o /tmp/xray.zip && \
    unzip -q /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip
COPY config.json /etc/xray/config.json
EXPOSE 8080
CMD ["xray", "run", "-c", "/etc/xray/config.json"]

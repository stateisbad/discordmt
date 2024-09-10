FROM python:alpine

RUN addgroup -S -g 1000 discord && \
    adduser -S -G discord -h /app -u 1000 discord && \
    chown -R discord:discord /app

USER discord

RUN pip install aiohttp && \
    pip install discord.py

COPY --chown=discord:discord server.py /app/server.py

WORKDIR /app

RUN chmod +x server.py

EXPOSE 8080

CMD ["./server.py"]

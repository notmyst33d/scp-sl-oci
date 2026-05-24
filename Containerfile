FROM debian:13

RUN apt update -y && apt install -y libicu76 ca-certificates ffmpeg

COPY ./entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]


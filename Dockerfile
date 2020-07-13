FROM python:3

RUN apt update
RUN apt install -y jq curl
RUN pip install yq

COPY get-markdown.sh /get-markdown.sh

ENTRYPOINT ["./get-markdown.sh"]
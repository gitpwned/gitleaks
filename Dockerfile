FROM alpine:3.10

RUN apk --update add --no-cache python3 py3-requests py3-pip py3-lxml py3-requests openssl ca-certificates
RUN apk --update add --virtual build-dependencies python3-dev build-base wget git \
  && git clone https://github.com/gitpwned/gitleaks.git
WORKDIR gitleaks

RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3", "gitleaks"]
CMD ["--help"]

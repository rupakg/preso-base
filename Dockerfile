# base image for preso-base
# it needs to be built as preso-base:latest-onbuild

FROM golang:1.10-alpine
MAINTAINER Rupak Ganguly <rupakg@gmail.com>

RUN apk add --no-cache git
RUN go get golang.org/x/tools/cmd/present
COPY preso-run /run/

RUN mkdir -p /base/static && mkdir -p /base/templates
COPY static/ /base/static/
COPY templates/ /base/templates/

ONBUILD COPY . /app

EXPOSE 3999

WORKDIR /app
CMD ["present", "-http=0.0.0.0:3999", "-base=/base"]

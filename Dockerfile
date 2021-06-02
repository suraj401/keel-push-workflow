FROM golang:alpine AS build-env
WORKDIR /usr/local/go/src/github.com/surajneosoft/keel-push-workfloww
COPY . /usr/local/go/src/github.com/surajneosoft/keel-push-workflow
RUN go install -ldflags="-w -s"

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build-env /usr/local/go/bin/keel-push-workfloww /bin/keel-push-workfloww
CMD ["push-workflow-example"]

EXPOSE 8500

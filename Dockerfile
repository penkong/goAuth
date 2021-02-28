############################
# STEP 1 build executable binary
############################

FROM golang:alpine AS builder
LABEL author="mazdak nazemi"
# Install git.
# Git is required for fetching the dependencies.
# RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/github.com/penkong/goAuth
# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .
COPY config.env config.env
COPY . .


# Fetch dependencies.
# Using go get.
RUN go mod download
RUN go mod verify

RUN go get -d -v ./...
RUN go install -v ./...

# Unit tests
# RUN CGO_ENABLED=0 go test -v

# Build the binary.
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/goAuth

############################
# STEP 2 build a small image
############################

FROM scratch
# Copy our static executable.
COPY --from=builder /go/bin/goAuth /go/bin/goAuth

EXPOSE 5050
# Run the hello binary.
ENTRYPOINT ["/go/bin/goAuth"]

# FROM golang:onbuild
# EXPOSE 5050
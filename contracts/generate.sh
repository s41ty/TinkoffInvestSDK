#!/bin/bash

protoc --swift_opt=Visibility=Public --swift_out=../Sources/TinkoffInvestSDK/Proto ./*.proto
protoc --grpc-swift_opt=Visibility=Public --grpc-swift_out=../Sources/TinkoffInvestSDK/Proto ./*.proto

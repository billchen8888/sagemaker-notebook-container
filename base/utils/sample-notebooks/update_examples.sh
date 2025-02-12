#!/bin/bash
# Download SageMaker examples from github
# Additional examples:
#   https://github.com/fastai/course-v3
#   https://github.com/pytorch/tutorials

pushd /tmp
wget https://github.com/awslabs/amazon-sagemaker-examples/archive/master.zip -O amazon-sagemaker-examples.zip
unzip -q amazon-sagemaker-examples.zip
#mv amazon-sagemaker-examples-master/* $SAMPLE_NOTEBOOKS_DIR/
mv amazon-sagemaker-examples-main/* $SAMPLE_NOTEBOOKS_DIR/
# aws archived package name changed to amazon-sagemaker-examples-main
rm -rf amazon-sagemaker-examples*
popd

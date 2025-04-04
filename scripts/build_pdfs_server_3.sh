#!/bin/bash

OUT_DIR="release/tmp"

DATE=$(date +"%m/%d/%Y")

SERVERVERSION="3.4.8"
TERRAFORMVERSION="0.15.4"
KUBECTLVERSION="1.19"
KUBERNETESVERSIONS="1.26 - 1.31"
HELMVERSION="3.9.2"
KOTSVERSION="1.65.0"

COMMENT="FINAL"

# Build Overview
echo "Building Server Overview..."
asciidoctor-pdf -v
asciidoctor-pdf \
-a pdf-style=jekyll/_cci2/_release-pdf/circle-theme.yml \
-a pdf-fontsdir=jekyll/_cci2/_release-pdf/fonts \
-a skip-front-matter \
-a pdf=true \
-a revdate="${DATE}" \
-a revnumber="${SERVERVERSION}" \
-a revremark="${COMMENT}" \
-a serverversion="${SERVERVERSION}" \
-a terraformversion="${TERRAFORMVERSION}" \
-a kubectlversion="${KUBECTLVERSION}" \
-a kubernetesversions="${KUBERNETESVERSIONS}" \
-a helmversion="${HELMVERSION}" \
-a kotsversion="${KOTSVERSION}" \
-D ${OUT_DIR} \
-o CircleCI-Server-${SERVERVERSION}-Overview.pdf jekyll/_cci2/_server-3-overview.adoc
echo "Done!"

# Build Ops Guide
echo "Building Server Operations Guide..."
asciidoctor-pdf \
-a pdf-style=jekyll/_cci2/_release-pdf/circle-theme.yml \
-a pdf-fontsdir=jekyll/_cci2/_release-pdf/fonts \
-a skip-front-matter \
-a pdf=true \
-a revdate="${DATE}" \
-a revnumber="${SERVERVERSION}" \
-a revremark="${COMMENT}" \
-a serverversion="${SERVERVERSION}" \
-a terraformversion="${TERRAFORMVERSION}" \
-a kubectlversion="${KUBECTLVERSION}" \
-a kubernetesversions="${KUBERNETESVERSIONS}" \
-a helmversion="${HELMVERSION}" \
-a kotsversion="${KOTSVERSION}" \
-D ${OUT_DIR} \
-o CircleCI-Server-${SERVERVERSION}-Operations-Guide.pdf jekyll/_cci2/_server-3-ops-guide.adoc
echo "Done!"

# Build Install Guide for GCP
echo "Building Server Installation Guide for GCP..."
asciidoctor-pdf \
-a env-gcp=true \
-a pdf-style=jekyll/_cci2/_release-pdf/circle-theme-install.yml \
-a pdf-fontsdir=jekyll/_cci2/_release-pdf/fonts \
-a skip-front-matter \
-a pdf=true \
-a revdate="${DATE}" \
-a revnumber="${SERVERVERSION}" \
-a revremark="${COMMENT}" \
-a serverversion="${SERVERVERSION}" \
-a terraformversion="${TERRAFORMVERSION}" \
-a kubectlversion="${KUBECTLVERSION}" \
-a kubernetesversions="${KUBERNETESVERSIONS}" \
-a helmversion="${HELMVERSION}" \
-a kotsversion="${KOTSVERSION}" \
-D ${OUT_DIR} \
-o CircleCI-Server-${SERVERVERSION}-GCP-Installation-Guide.pdf jekyll/_cci2/_server-3-install-guide-gcp.adoc
echo "Done!"

# Build Install Guide for AWS
echo "Building Server Installation Guide for AWS..."
asciidoctor-pdf \
-a env-aws=true \
-a pdf-style=jekyll/_cci2/_release-pdf/circle-theme-install.yml \
-a pdf-fontsdir=jekyll/_cci2/_release-pdf/fonts \
-a skip-front-matter \
-a pdf=true \
-a revdate="${DATE}" \
-a revnumber="${SERVERVERSION}" \
-a revremark="${COMMENT}" \
-a serverversion="${SERVERVERSION}" \
-a terraformversion="${TERRAFORMVERSION}" \
-a kubectlversion="${KUBECTLVERSION}" \
-a kubernetesversions="${KUBERNETESVERSIONS}" \
-a helmversion="${HELMVERSION}" \
-a kotsversion="${KOTSVERSION}" \
-D ${OUT_DIR} \
-o CircleCI-Server-${SERVERVERSION}-AWS-Installation-Guide.pdf jekyll/_cci2/_server-3-install-guide-aws.adoc
echo "Done!"
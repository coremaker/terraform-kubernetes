[![Maintained by coremaker.io](https://img.shields.io/badge/maintained%20by-coremaker.io-green)](https://coremaker.io/)
[![Coremaker Docs](https://img.shields.io/badge/coremaker-docs-green)](https://coremaker.io/)
# Terraform Kubernetes Module

This repository contains a [`terraform`] module for running the main operators inside our [`kubernetes`] clusters.
Works best if used with our [`terraform-google-module`]!

## Flux - Fluxv2

Continuous delivery is a term that encapsulates a set of best practices that surround building, deploying and monitoring applications. The goal is to provide a sustainable model for maintaining and improving an application.

Flux is a tool that automates the deployment of containers to Kubernetes. It fills the automation void that exists between building and monitoring

Flux’s main feature is the automated synchronisation between a version control repository and a cluster. If you make any changes to your repository, those changes are automatically deployed to your cluster.

More information about [`flux`].

## Sealed-secrets

Encrypt your Secret into a SealedSecret, which is safe to store - even to a public repository. The SealedSecret can be decrypted only by the controller running in the target cluster and nobody else (not even the original author) is able to obtain the original Secret from the SealedSecret.

The certificates are stored in sealedsecret-keys folder, every k8s cluster has its own certificate with which its decrypting the secrets. The secret has to be resealed in every environment for sealed-secret to be able to decrypt it.

More information about [`sealed-secrets`].

## Cert-Manager

[`terraform-google-module`]: https://github.com/coremaker/terraform-google-nucleus
[`kubernetes`]: https://kubernetes.io/
[`terraform`]: https://www.terraform.io
[`sealed-secrets`]: https://github.com/bitnami-labs/sealed-secrets
[`flux`]: https://docs.fluxcd.io/en/1.18.0/introduction.html
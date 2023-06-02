name: Terraform destroy
on:
  workflow_dispatch:

permissions:
  id-token: write
  contents: read

jobs:
  terraform_destroy:
    name: Terraform destroy
    runs-on: ubuntu-latest
    environment: dev
    env:
      ARM_CLIENT_ID: "${{ secrets.AZURE_CLIENT_ID }}"
      ARM_SUBSCRIPTION_ID: "${{ secrets.AZURE_SUBSCRIPTION_ID }}"
      ARM_TENANT_ID: "${{ secrets.AZURE_TENANT_ID }}"
      ARM_CLIENT_SECRET: "${{ secrets.AZURE_AD_CLIENT_SECRET }}"

    # Use the Bash shell regardless whether the GitHub Actions runner is ubuntu-latest, macos-latest, or windows-latest
    defaults:
      run:
        shell: bash

    steps:
      # Checkout the repository to the GitHub Actions runner
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: 1.1.7
          terraform_wrapper: false
          
      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan -input=false

      - name: Terraform Destroy
        run: terraform destroy -auto-approve

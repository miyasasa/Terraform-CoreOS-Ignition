MODULE 		:= $(shell basename $$PWD)
TIMESTAMP := $(shell date +%Y-%m-%d-%H%M%S)

.PHONY: get plan plan-destroy plan-output apply

state-pull:
	@terraform state pull

fmt:
	@terraform fmt

get:
	@terraform init

plan: get fmt
	@terraform plan -var-file ./$(MODULE).tfvars

plan-output: get fmt
	@terraform plan -var-file ./$(MODULE).tfvars -out $(MODULE)-$(TIMESTAMP).plan

plan-destroy: get fmt
	@terraform plan -var-file ./$(MODULE).tfvars -destroy

plan-destroy-output: get fmt
	@terraform plan -var-file ./$(MODULE).tfvars -destroy -out $(MODULE)-destroy-$(TIMESTAMP).plan

apply: get fmt
	@terraform apply -var-file ./$(MODULE).tfvars

apply-plan:
	@terraform apply $(PLAN)

clean:
	@rm *.plan

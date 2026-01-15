package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformDevEnvironment(t *testing.T) {
	t.Parallel()

	tfOptions := &terraform.Options{
		TerraformDir: "../environment/dev",
	}

	// Always cleanup
	defer terraform.Destroy(t, tfOptions)

	// Init + Apply
	terraform.InitAndApply(t, tfOptions)

	// 👇 YAHAN OUTPUT READ KARNA HAI
	rgMap := terraform.OutputMap(t, tfOptions, "resource_groups_info")

	// 👇 YAHAN ASSERTION
	assert.Equal(t, "tittu11", rgMap["rg1"])
}

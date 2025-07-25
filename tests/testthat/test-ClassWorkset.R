test_that("OpenMppWorkset class works", {
  skip_if_not(test_connection())

  use_OpenMpp_local()
  model_name <- get_models()$Name[[1]]
  workset_name <- get_worksets(model_name)$Name[[1]]
  workset <- load_workset(model_name, workset_name)

  # Tests
  expect_no_error(load_scenario(model_name, workset_name))
  expect_type(workset, 'environment')
  expect_s3_class(workset, c("OpenMppWorkset", "OpenMppModel", "R6"), TRUE)
  expect_s3_class(workset$TablesInfo, 'data.frame')
  expect_s3_class(workset$ParamsInfo, 'data.frame')
  expect_s3_class(workset$ModelTasks, 'data.frame')
  expect_s3_class(workset$ModelRuns, 'data.frame')
  expect_s3_class(workset$ModelScenarios, 'data.frame')
  expect_s3_class(workset$ModelWorksets, 'data.frame')
  expect_type(workset$Parameters, 'environment')
  expect_type(workset$ModelMetadata, 'list')
  expect_type(workset$WorksetMetadata, 'list')
  expect_type(workset$ModelVersion, 'character')
  expect_type(workset$ModelName, 'character')
  expect_type(workset$WorksetName, 'character')
  expect_type(workset$ModelDigest, 'character')
  expect_type(workset$OpenMppType, 'character')
  expect_type(workset$BaseRunDigest, 'character')
  expect_type(workset$ReadOnly, 'logical')
  expect_equal(workset$OpenMppType, 'Workset')
})

#' Simulate selected scenarios, or load scenario results from a folder
#'
#' @param projectConfiguration The `ProjectConfiguration` used to create the project.
#' @param loadPreSimulatedResults If `TRUE`, results will be loaded from the folder specified in `loadResultsFolder`
#' @param scenarioNames Names of scenarios to simulate (or load)
#' @param loadResultsFolder Sub-folder where simulated results is located, in case 
#' `loadPreSimulatedResults` is `TRUE`. The folder must be located in the "SimulationResults"
#'  folder defined in the `ProjectConfiguration`.
#' @param saveResultsFolder Sub-folder where the results will be stored. 
#' If `NULL`, a folder in the "Results" folder with current data name will be created.
#' @param customParams A list containing vectors 'paths' with the full paths to the parameters, 'values' the values of the parameters, and 'units' with the units the values are in. The values to be applied to the model.
#' @param stopIfParameterNotFound If `TRUE`, the execution will be terminated if 
#' any parameter specified is not found in the simulation. The value `FALSE` should
#' be used with caution, as if a parameter defined for the scenario is not found in the 
#' simulation is often a sign of a problem in scenario definition.
#' @param simulationRunOptions Object of type SimulationRunOptions that will be passed to simulation runs. If NULL, default options are used.
#' Can be used to, e.g., disable check for negative values.

#'
#' @returns A named list with `simulationScenarios` the output of `esqlabsR::runScenarios()` function, `scenarios` a list of created `Scenario` objects, and `outputFolder` the path to the folder where the results are stored.
simulateScenarios <- function(projectConfiguration,
                              scenarioNames = NULL,
                              customParams = NULL,
                              stopIfParameterNotFound = TRUE,
                              simulationRunOptions = NULL,
                              loadPreSimulatedResults = FALSE,
                              loadResultsFolder = NULL,
                              saveResultsFolder = NULL) {

  ########### Initializing and running scenarios########
  ospsuite.utils::validateIsOfType(projectConfiguration, ProjectConfiguration)
  # Create `ScenarioConfiguration` objects from excel files
  scenarioConfigurations <- esqlabsR::readScenarioConfigurationFromExcel(
    scenarioNames = scenarioNames,
    projectConfiguration = projectConfiguration
  )

  outputFolder <- NULL
  scenarios <- NULL

  # Run or load scenarios
  if (loadPreSimulatedResults) {
    simulatedScenariosResults <- esqlabsR::loadScenarioResults(
      names(scenarioConfigurations),
      file.path(projectConfiguration$outputFolder, "SimulationResults", loadResultsFolder)
    )
  } else {
    # Create scenarios
    scenarios <- esqlabsR::createScenarios(scenarioConfigurations = scenarioConfigurations, customParams = customParams,
                                 stopIfParameterNotFound = stopIfParameterNotFound)
    simulatedScenariosResults <- esqlabsR::runScenarios(
      scenarios = scenarios,
      simulationRunOptions = simulationRunOptions
    )
    outputFolder <- esqlabsR::saveScenarioResults(simulatedScenariosResults = simulatedScenariosResults, projectConfiguration = projectConfiguration, outputFolder = saveResultsFolder)
  }

  # Return simulated scenarios
  return(list(simulatedScenarios = simulatedScenariosResults, scenarios = scenarios, outputFolder = outputFolder))
}

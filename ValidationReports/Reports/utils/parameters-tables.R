#' Create a table listing the values of parameters of scenarios.
#'
#' @param paths A vector of simulation paths to the parameters.
#' @param aliases A vector of aliases for the parameters. The parameters will be listed 
#' in the table with their aliases. Must have the same lengths as `paths`.
#' @param units A vector of units for the parameters. The parameters will be listed
#' in the table in these units. Must have the same lengths as `paths`.
#' @param reportResults Output of the function `createResults()`. A named list 
#' with the entries `scenarioResults`, `observedData`, and `plots`.
#' @param scenario The name of the scenario or a list of names to extract the parameter values from.
#' For each scenario, a separate column will be created.
#'
#' @returns A `tibble` with the columns `Parameter` listing parameter aliases,
#' `<Scenario Name>'  value of the parameter in the respective scenario, and `Unit`.
getParameterValuesAsTable <- function(reportResults, scenarios, aliases, paths, units){
  paramsTable <- tibble::tibble(
      "Parameter" = aliases
    )
  for (scenario in scenarios){
    simulation <- reportResults$scenarioResults$simulatedScenarios[[scenario]]$simulation
    paramsTable[[scenario]] <- ospsuite::getQuantityValuesByPath(paths,
                                                         units = units,
                                                         simulation = simulation
    )
  }

  paramsTable[["Unit"]] <- units

  return(paramsTable)
}

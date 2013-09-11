@RaffleCtrl = ($scope) ->
  $scope.entries = [
    {name: "Tom"}
    {name: "Jack"}
    {name: "clark"}
  ]

  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}

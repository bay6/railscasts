app = angular.module("Raffler", ["ngResource"])

@RaffleCtrl = ($scope, $resource) ->
  Entry = $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
  $scope.entries = Entry.query()

  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.winner = true
      $scope.lastWinner = entry

Raffler.Store = DS.Store.extend
  revision: 4
  #adapter: DS.RESTAdapter.create()

DS.RESTAdapter.configure("plurals", entry: "entries")

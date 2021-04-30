let useAddressBook = () => {
  let (users, setUsers) = React.useState(_ => [])

  React.useEffect0(() => {
    let _ = RandomUserApi.loadData()->Js.Promise.then_((result: RandomUserApi.result) => {
      Js.log(result.results)
      setUsers(_ => result.results)
      Js.Promise.resolve(None)
    }, _)
    None
  })

  Js.log(users)
  users
}

@react.component
let make = () => {
  let users = useAddressBook()

  <div>
    {
      open Js.Array2
      users
      ->map((user: RandomUserApi.user) => {
        let name = user.name.first ++ " " ++ user.name.last
        <div key={name}> <img src={user.picture.thumbnail} /> {React.string(name)} </div>
      })
      ->React.array
    }
  </div>
}

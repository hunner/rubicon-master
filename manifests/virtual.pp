class users {
  @user { 'hunner':  groups => ['dev','ops'], }
  @user { 'elvis':   groups => ['dev',], }
  @user { 'batesn':  groups => ['dev',], }
  @user { 'binford': groups => ['ops'], }

}
class devs {
  include users
  User <| groups == 'dev' |>
}

class ops {
  include users
  User <| groups == 'ops' |>
}

node foo {
  include devs
  include ops
}
node bar {
  include devs
}

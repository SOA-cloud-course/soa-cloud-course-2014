# How to use

It requires Ruby version >=1.9.3

## Install dependencies

Install missing Ruby gems
```
bundle install
```

## Run

### Stateless calculator

For help:
```
ruby client.rb -h
```
To perform tests:
```
ruby client.rb -n rpn --url http://localhost:4567/calc
```

### Stateful calculator

For help:
```
ruby client-state.rb -h
```
To perform tests:
```
ruby client-state.rb -n rpn --url http://localhost:4567/calc2
```

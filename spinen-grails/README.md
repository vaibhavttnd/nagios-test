# spinen-grails-cookbook

This cookbook is essentially the same as the [maven cookbook](https://github.com/opscode-cookbooks/maven). It uses the ark cookbook to install grails from a zip file.

## Supported Platforms

Ubuntu


## Usage

### spinen-grails::default

Include `spinen-grails` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[spinen-grails::default]"
  ]
}
```

## License and Authors

Author:: SPINEN (<luke.reimer@spinen.com>)

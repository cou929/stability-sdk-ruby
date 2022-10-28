# StabilitySDK - Ruby client for stability.ai APIs, such as Stable Diffusion

A ruby client for [stability.ai](https://stability.ai/) APIs, e.g., [Stable Diffusion](https://stability.ai/blog/stable-diffusion-public-release). Referring to https://github.com/Stability-AI/stability-sdk.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stability_sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stability_sdk

## Usage
First, you need to create a [DreamStudio](https://beta.dreamstudio.ai/home)'s account and get an API Key of it.

- Access [DreamStudio](https://beta.dreamstudio.ai/dream) and create an account if you have not had it
- Go to the [membership page](https://beta.dreamstudio.ai/membership)
- You can get the API Key in an `API Key` tab

### Command line usage

```sh
STABILITY_SDK_API_KEY=YOUR_API_KEY stability-client 'A night in winter, oil-on-canvas landscape painting, by Vincent van Gogh'
```

This command saves an image like this:

![3749380973_A_night_in_winter__oil_on_canvas_landscape_painting__by_Vincent_van_Gogh](https://user-images.githubusercontent.com/25668/188884116-0b03494b-0b34-49de-bbbc-89fbc2f6029d.png)

img2img example:

```sh
STABILITY_SDK_API_KEY=YOUR_API_KEY stability-client --init_image=/path/to/image.png --mask_image=/path/to/mask.png 'your prompt'
```


```sh
Usage: stability-client [options] YOUR_PROMPT_TEXT

Options:
        --api_key=VAL                api key of DreamStudio account. You can also specify by a STABILITY_SDK_API_KEY environment variable
    -H, --height=VAL                 height of image in pixel. default 512
    -W, --width=VAL                  width of image in pixel. default 512
    -C, --cfg_scale=VAL              CFG scale factor. default 7.0
    -A, --sampler=VAL                ddim, plms, k_euler, k_euler_ancestral, k_heun, k_dpm_2, k_dpm_2_ancestral, k_lms. default k_lms
    -s, --steps=VAL                  number of steps. default 50
    -S, --seed=VAL                   random seed to use in integer
    -p, --prefix=VAL                 output prefixes for artifacts. default `generation`
        --no-store                   do not write out artifacts
    -n, --num_samples=VAL            number of samples to generate
    -e, --engine=VAL                 engine to use for inference. default `stable-diffusion-v1`
    -i, --init_image=VAL             path to init image
    -m, --mask_image=VAL             path to mask image
        --start_schedule=VAL         start schedule for init image (must be greater than 0, 1 is full strength text prompt, no trace of image). default 1.0
        --end_schedule=VAL           end schedule for init image. default 0.01
    -v, --verbose
```

### SDK usage

This sample code saves a generated image as `result.png`.

```ruby
require "stability_sdk"

client = StabilitySDK::Client.new(api_key: "YOUR_API_KEY", timeout: 600)

prompt = "your prompot here"
options = {}

# for the case of img2img:
# options[:init_image] = "/path/to/image.png"
# options[:mask_image] = "/path/to/mask.png"

client.generate(prompt, options) do |answer|
  answer.artifacts.each do |artifact|
    if artifact.type == :ARTIFACT_IMAGE
      File.open("result.png", "wb") do |f|
        f.write(artifact.binary)
      end
    end
  end
end
```

### [Unstable] Dashboard API

**This feature is in a very early stage of development.**

Dashboard API is a way to interact with DreamStudio Web UIs, such as getting user info, payment info, etc.

Currently, there is no canonical way to get the API key for the Dashboard API. You can retrieve the key by logging in to the [DreamStudio Web page](https://beta.dreamstudio.ai/dream) and inspect request the authorization header with Chrome Developer Tool. Please be aware that how to refresh the key or an expiration period is unknown. See also https://github.com/Stability-AI/stability-sdk/issues/23

```sh
# get user info
STABILITY_SDK_DASHBOARD_API_KEY=YOUR_API_KEY stability-dashboard-client-unstable get_me

# get organization info
STABILITY_SDK_DASHBOARD_API_KEY=YOUR_API_KEY stability-dashboard-client-unstable get_organization

# i.e, get remaining balance
STABILITY_SDK_DASHBOARD_API_KEY=YOUR_API_KEY stability-dashboard-client-unstable get_organization | jq .paymentInfo.balance
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cou929/stability-sdk-ruby.

# bubblematrix


<!-- badges: start -->

[![R-CMD-check](https://github.com/kaneplusplus/bis620/workflows/R-CMD-check/badge.svg)](https://github.com/hyj12345/bubblematrix/actions)
<!-- badges: end -->

![example][(https://img.shields.io/badge/example-v1.0-red.svg)](https://github.com/hyj12345/bubblematrix/actions)

This package is created to help create your own bubble matrix plot.

## Test and build package

``` r
library(roxygen2)
roxygenize("/Users/hanbujishenmebuhui/Desktop/my R pkg/bubblematrix")
library(devtools)
check("/Users/hanbujishenmebuhui/Desktop/my R pkg/bubblematrix")
load_all()
bubblematrix::bubble_matrix()
bubblematrix::example_data
```

## Installation

You can install the released version of bubblematrix from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hyj12345/bubblematrix")
```

## Example

Let's use the data in the package to have a simple test

### View the built-in dataset

```r
library(bubblematrix)
data(package="bubblematrix")
example_data<-bubblematrix::example_data
```



And we can get the information:

![image-0](https://github.com/hyj12345/bubblematrix/blob/main/png/data_info.png)


And the data

![image-0](https://github.com/hyj12345/bubblematrix/blob/main/png/data.png)



  

### Create the bubble matrix plot

* Just use the default parameters

```r
bubble_matrix(data = example_data)
```

And we can get the (ploty) plot


![image-1](https://github.com/hyj12345/bubblematrix/blob/main/png/default.png)


* Use the customized parameters

```r
bubble_matrix(data = example_data,percentile = c(0,0.5,1),
              labels = c('Lowest part','Highest part'),
              color = c('red','black'),
              title = 'Bubble matrix plot',subtitle = 'test the pkg'
              ,caption = '@YJ_Han',ploty_ = FALSE)
```

And we can get the plot


![image-2](https://github.com/hyj12345/bubblematrix/blob/main/png/setting.png)



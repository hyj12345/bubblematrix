# bubblematrix

This package is created to help create your own bubble matrix plot.

## Test and build package

``` r
library(roxygen2)
roxygenize("/Users/hanbujishenmebuhui/Desktop/my R pkg/bubblematrix")
library(devtools)
check("/Users/hanbujishenmebuhui/Desktop/my R pkg/bubblematrix")
load_all()
bubble_matrix()
```

## Installation

You can install the released version of bubblematrix from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hyj12345/bubblematrix")
```

## Example

I put the `example` data in my pacakge as the example(also the default data in my function). Feel free to use it as the simple test. 

### View the built-in dataset

```r
library(bubblematrix)
data(package="bubblematrix")
```

And we can get the information:

**Data sets in package ‘bubblematrix’:**

**example**     

### Create the bubble matrix plot

* Just use the default parameters

```r
data_ma <- data(example)
bubble_matrix(data = data_ma)
```

And we can get the (ploty) plot


![image-1](https://github.com/hyj12345/bubblematrix/blob/main/png/default.png)


* Use the customized parameters

```r
bubble_matrix(data = data_ma,percentile = c(0,0.5,1),
              labels = c('Lowest part','Highest part'),
              color = c('red','black'),
              title = 'Bubble matrix plot',subtitle = 'test the pkg'
              ,caption = '@YJ_Han',ploty_ = FALSE)
```

And we can get the plot


![image-2](https://github.com/hyj12345/bubblematrix/blob/main/png/setteing.png)



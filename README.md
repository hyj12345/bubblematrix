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

Let's use the data to have a simple test

```r
example_data<-data.frame(malca=c(0.06367852,0.06363917,0.06312858),
                         colca=c(0.004332353,0.004332353,0.004332353),
                         brca=c(0.01742586,0.01989593,0.01831502),
                         prca=c(0.03420144,0.03420144,0.03420144),
                         cancer=c(0.06367852,0.06363917,0.06312858))
```

### View the built-in dataset

```r
library(bubblematrix)
data(package="bubblematrix")
```

And we can get the information:

**Data sets in package ‘bubblematrix’:**

**example_data             An example data for bubble_matrix()**     

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



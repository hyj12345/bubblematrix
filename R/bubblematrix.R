#'This is some description of this function.
#'@title simple function
#'
#'@description today,I create my first function,a very usrful function.
#'
#'@details you can use this function to caculate x+1,then return the value of x+1.
#'
#'@param x x is a number
#'
#'@return a dataframe
#'
#'@export
#'
#
example_data<-data.frame(malca=c(0.06367852,0.06363917,0.06312858),
                         colca=c(0.004332353,0.004332353,0.004332353),
                         brca=c(0.01742586,0.01989593,0.01831502),
                         prca=c(0.03420144,0.03420144,0.03420144),
                         cancer=c(0.06367852,0.06363917,0.06312858))


bubble_matrix<-function(data=example_data
                        ,percentile=c(0,.25,.5,.75,1)
                        ,labels=c("lowest rate","below rate","above rate","highest rate")
                        ,color=c("#F9DBD3","#F1B255","#519F46","#41B0C3")
                        ,ploty_=TRUE
                        ,title='',subtitle='',caption=''){
  library(reshape2)
  library(ggplot2)
  library("grid")
  library(magrittr)
  library(plotly)
  data_melt<-melt (data)%>%cbind(as.data.frame(rep(row.names(data),length(colnames(data)))))
  names(data_melt) = c('Class', 'Value','Group')
  qa<-quantile(data_melt$Value,percentile)
  data_melt$Value_quantile<-cut(data_melt$Value,breaks=qa,labels =labels,include.lowest=TRUE,ordered=T)
  gg<-ggplot(data_melt)+
    geom_hline(aes(x=Group,y=Class,yintercept = 1:nrow(data_melt)),size=20,colour="#E4EDF2",alpha=.5)+
    geom_vline(aes(x=Group,y=Class,xintercept = 1:nrow(data_melt)),linetype="dashed")+
    geom_point(aes(x=Group,y=Class,size=Value,fill=Value_quantile),shape=21,colour="white")+
    scale_fill_manual(values=color)+
    scale_size_area(max_size=25)+
    scale_x_discrete(position = "top")+
    guides(size=FALSE,fill=guide_legend(title='Quantile',,direction="horizontal"))+
    labs(title=title,subtitle=subtitle,caption=caption)+
    theme_void(base_size=15)+
    theme(
      legend.position="top",
      panel.grid.major.x=element_line(linetype="dashed"),      #plot.margin=margin(5,5,5,5,unit="pt"),
      axis.text=element_text(size=7,hjust=0.5),
      plot.title=element_text(size=20,hjust=0,lineheight=1.2),
      plot.caption=element_text(hjust=0,lineheight=1.2),
      axis.text.x=element_text(angle=10, hjust=1))

  if (ploty_==TRUE){
    ggplotly(gg)
  }else{
    gg
  }
}




#'This is some description of this function.
#'@title bubblematrix function
#'
#'@description Create your own dynamic or state bubblematrix plot
#'
#'@details you can use this function to plot bubblematrix(ploty or not).
#'
#'@param data
#'@param percentile Determine the sub-locations for the drawing
#'@param labels labels of each interval
#'@return None Show the plot
#'
#'@export
#'
#



bubble_matrix<-function(data
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




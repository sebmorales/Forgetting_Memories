void forget(){
  if (currentPixel>nPixelsDying){
  image(img,0,0);
  }
  if (currentPixel<nPixelsDying){
    background(0);
  }
  loadPixels();
  if (currentPixel>nPixelsDying){
    for (int i=totalPixels; i> (currentPixel-nPixelsDying); i--){
      pixels[i]=color(0);
    }
  }
  if (currentPixel<nPixelsDying){
    while (currentPixel>=0){
      pixels[currentPixel]=color (0);
      currentPixel--;
    }
  }
  updatePixels(); 
  desintegrate();
  //saveFrame("frames/#########.png");
  currentPixel=currentPixel-nPixelsDying;
  if (currentPixel<0){
    currentPixel=0;
  }
}
  
  
void desintegrate(){    
    for (int i=particleRangeMin; i < particleRangeMax; i++) {
      agents[i].update();  
      agents[i].edges();
      agents[i].display();
      if (particleRangeMax>totalPixels){
        particleRangeMax=totalPixels;
      }  
    }
    if (particleRangeMax==totalPixels){
      for (int i=particleRangeMin; i < totalPixels; i++) {
        agents[i].update();  
        agents[i].edges();
        agents[i].display();
      }
      particleRangeMin=particleRangeMin+(nPixelsDying);
    }
    
    if(particleRangeMin>=totalPixels){
      image(nImg,(img.width-nImg.width)/2,(img.height-nImg.height)/2);
      if(!imageSaved){
      save(memoryToForget);
      imageSaved=true;
      }
      
    }
    if(particleRangeMax<totalPixels){
      particleRangeMax=particleRangeMax+nPixelsDying;
      particleRangeMin=particleRangeMax-maxParticles;
    }
    if (particleRangeMin<0){
      particleRangeMin=0;
    }
}

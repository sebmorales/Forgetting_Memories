void forget() {
  if (currentPixel>nPixelsDying) { //as long as there are still pixels to be removed keep showing img
    image(img, 0, 0);
  }
  if (currentPixel<nPixelsDying) { 
    background(0);
  }
  loadPixels();
  if (currentPixel>nPixelsDying) {
    for (int i=totalPixels; i> (currentPixel-nPixelsDying); i--) {
      pixels[i]=color(0);
    }
  }
  if (currentPixel<nPixelsDying) { //this will run only for the last pixels
    while (currentPixel>=0) {
      pixels[currentPixel]=color (0);
      currentPixel--;
    }
  }
  updatePixels(); 
  desintegrate();
  //saveFrame("frames/#########.png");
  currentPixel-=nPixelsDying;
  if (currentPixel<0) {
    currentPixel=0;
  }
}


void desintegrate() {    
  for (int i=particleRangeMin; i < particleRangeMax; i+=4) {
    agents[i].update();  
    agents[i].display();
    newParticleMin=i;

   // i=i+int(random(0, 5));
    if (particleRangeMax>totalPixels) {
      particleRangeMax=totalPixels;
    }
  }

  //Kill the rest pixels once the image has been desintegrated.
  if (particleRangeMax==totalPixels) {
    for (int i=particleRangeMin; i < totalPixels; i+=4) {
     // i++;
      agents[i].update();  
      agents[i].display();
    }
    particleRangeMin+=nPixelsDying;
  }

  if (particleRangeMin>=totalPixels) {
    image(replacementImage, (img.width-replacementImage.width)/2, (img.height-replacementImage.height)/2);
    if (!imageSaved) {
      save(memoryToForget);
      imageSaved=true;
    }
  }
  if (particleRangeMax<totalPixels) {
    particleRangeMax+=nPixelsDying;
    particleRangeMin=newParticleMin-maxParticles;
  }
  if (particleRangeMin<0) {
    particleRangeMin=0;
  }
}


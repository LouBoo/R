l <- 6
j <- 6
m <- 8
l_loss <- 0
j_loss <- 0
m_loss <- 0
count <- 0

for (i in 1:2000) {
  while (l > 0 & j > 0 & m > 0) {
    a <- sample(1:6, 1)
    if (a==1) {
      l <- l + 1
      m <- m - 1
      m_loss <- m_loss + 1
      count <- count + 1
      print("Louis is first, Jungbin is second, and Min is third")
      } else if (a==2) {
        l <- l + 1
        j <- j - 1
        j_loss <- j_loss + 1
        count <- count + 1
        print("Louis is first, Min is second, and Jungbin is third")
      } else if (a==3) {
        j <- j + 1
        m <- m - 1
        m_loss <- m_loss + 1
        count <- count + 1
        print("Jungbin is first, Louis is second, and Min is third")
      } else if (a==4) {
        m <- m + 1
        j <- j - 1
        j_loss <- j_loss + 1
        count <- count + 1
        print("Min is first, Louis is second, and Jungbin is third")
      } else if (a==5) {
        j <- j + 1
        l <- l - 1
        l_loss <- l_loss + 1
        count <- count + 1
        print("Jungbin is first, Min is second, and Louis is third")
      } else {
        m <- m + 1
        l <- l - 1
        l_loss <- l_loss + 1
        count <- count + 1
        print("Min is first, Jungbin is second, and Louis is third")
      }
  }
}

rel_freq <- l_loss/count
rel_freq

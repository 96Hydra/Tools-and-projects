from moviepy.editor import VideoFileClip 

clip = VideoFileClip()
clip.write_gif("jif.gif", fps=25)  

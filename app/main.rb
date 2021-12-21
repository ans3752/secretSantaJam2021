
def tick args
  args.state.days = args.state.tick_count/(10*255)
  args.state.g ||= 1
  args.state.cam ||= Cam.new
  args.state.sceneCloser ||= {:x => 0, :y => 720 , w: 1280, h:720 * 3/2, :path => "/sprites/gummy.png", :closing => false}
  args.state.footprintSprite ||= {:x => 1280 /2, :y => 0, w:36, h:26, :path => "/sprites/footprint/footprint0.png", 
    :ani => Ani.new([
      "/sprites/footprint/footprint0.png",
      "/sprites/footprint/footprint1.png",
      "/sprites/footprint/footprint2.png",
      "/sprites/footprint/footprint3.png",
      "/sprites/footprint/footprint4.png",
      "/sprites/footprint/footprint5.png",
      "/sprites/footprint/footprint6.png",
      "/sprites/footprint/footprint7.png",
      ], 4)}
  
    args.state.bgCinderellaSleepingAni ||= Ani.new([ #excluding 0..6 png
      "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping05.png",
    "/sprites/background/sleeping/sleeping06.png",
    "/sprites/background/sleeping/sleeping07.png",
    "/sprites/background/sleeping/sleeping08.png",
    "/sprites/background/sleeping/sleeping09.png",
    "/sprites/background/sleeping/sleeping10.png",
    "/sprites/background/sleeping/sleeping10.png",
    "/sprites/background/sleeping/sleeping11.png",
    "/sprites/background/sleeping/sleeping12.png",
    "/sprites/background/sleeping/sleeping13.png",
    "/sprites/background/sleeping/sleeping14.png",
    "/sprites/background/sleeping/sleeping15.png",
    "/sprites/background/sleeping/sleeping16.png",
    "/sprites/background/sleeping/sleeping17.png",
    "/sprites/background/sleeping/sleeping18.png",
    "/sprites/background/sleeping/sleeping19.png",
    "/sprites/background/sleeping/sleeping20.png",
    "/sprites/background/sleeping/sleeping21.png",
    "/sprites/background/sleeping/sleeping22.png",
    "/sprites/background/sleeping/sleeping23.png",
    "/sprites/background/sleeping/sleeping24.png",
    "/sprites/background/sleeping/sleeping25.png",
    "/sprites/background/sleeping/sleeping26.png",
    "/sprites/background/sleeping/sleeping27.png",
    "/sprites/background/sleeping/sleeping28.png",
    "/sprites/background/sleeping/sleeping29.png",
    "/sprites/background/sleeping/sleeping29.png",
    "/sprites/background/sleeping/sleeping29.png",
    "/sprites/background/sleeping/sleeping28.png",
    "/sprites/background/sleeping/sleeping27.png",
    "/sprites/background/sleeping/sleeping27.png",
    "/sprites/background/sleeping/sleeping28.png",
    "/sprites/background/sleeping/sleeping29.png",
    "/sprites/background/sleeping/sleeping29.png",
    "/sprites/background/sleeping/sleeping29.png",
    ], 8)
    
    args.state.baymax ||= Baymax.new
    args.state.genBreaks ||= GenBreaks.new
    args.state.bad ||= Bad.new
    args.state.creakSound ||= PlaySound.new("/sounds/creak.wav", 380)
    args.state.warnSound ||= PlaySound.new("/sounds/darthVader/comeback.wav", 140)
    args.state.doormatDoorAni ||= Ani.new([
      "/sprites/door/doormatDoor/doormatDoor0.png",
    "/sprites/door/doormatDoor/doormatDoor1.png",
    "/sprites/door/doormatDoor/doormatDoor2.png",
    "/sprites/door/doormatDoor/doormatDoor3.png",
    "/sprites/door/doormatDoor/doormatDoor4.png",
    "/sprites/door/doormatDoor/doormatDoor5.png",
    "/sprites/door/doormatDoor/doormatDoor6.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    "/sprites/door/doormatDoor/doormatDoor7.png",
    ], 10)
    
  args.state.greenDoorAni ||= Ani.new([
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor00.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor01.png",
    "/sprites/door/greenDoor/greenDoor02.png",
    "/sprites/door/greenDoor/greenDoor03.png",
    "/sprites/door/greenDoor/greenDoor04.png",
    "/sprites/door/greenDoor/greenDoor05.png",
    "/sprites/door/greenDoor/greenDoor06.png",
    "/sprites/door/greenDoor/greenDoor07.png",
    "/sprites/door/greenDoor/greenDoor08.png",
    "/sprites/door/greenDoor/greenDoor09.png",
    "/sprites/door/greenDoor/greenDoor10.png",
    ], 5)
    
  args.state.sceneTimer ||= Timer.new
  args.state.light ||= false

  args.state.scene ||= "doormatScene"

  args.state.scene = "gameEnd" if args.state.days >= 5
  
  if args.state.scene == "gameEnd"
    gameEnd args
  end
  if args.state.scene == "doormatScene"
    args.outputs.sounds << "/sounds/bgm/bgm0ver1.mp3"
    doormatScene args
  end
  if args.state.scene == "cinderellaRoom"
    args.state.baymax.baymaxStat[:pick] = true
    args.state.snoringSound.playSound args
    cinderellaRoom args
  end
  if args.state.scene == "goatFight"
    goatFight args
  end
  if args.state.scene == "camTest"
    camTest args
  end
end

class Bad
  attr_reader :goat, :darthVader
  def initialize
    @goat = Goat.new
  end
end

def gameEnd args
  textInfo args, "5 days elapsed.. batteryRecord:#{args.state.baymax.baymaxStat[:battery]}"
  if args.state.bad.goat.stat[:health] > 0
    args.outputs.sounds << "/sounds/darthVader/dontFail.wav"
    args.state.bad.goat.stat[:health] = 0
  end
  args.gtk.notify! "gameEnd"
end

def camTest args
  camTestBackground = {x:0, y:0, w:1280, h:720, path:"/sprites/background/camTest.png"}
  textInfo args, "baymaxX: #{args.state.baymax.sprite[:x]}, baymaxY: #{args.state.baymax.sprite[:y]},ratio: #{args.state.cam.ratio}"
  mousePosInfo args
  args.state.cam.camWork args, camTestBackground

  args.state.baymax.activate args
  #args.outputs.sprites << args.state.baymax.sprite
  centerX = args.state.baymax.sprite[:x] + args.state.baymax.sprite[:w]/2
  centerY = args.state.baymax.sprite[:y] + args.state.baymax.sprite[:h]/2
  args.state.cam.setFocus centerX, centerY
  args.state.cam.camWork args, args.state.baymax.sprite

  args.state.cam.ratio += 0.01 if args.inputs.keyboard.p
  args.state.cam.ratio -= 0.01 if args.inputs.keyboard.m
  args.state.cam.zeroingY += 1 if args.inputs.keyboard.one
  args.state.cam.zeroingY -= 1 if args.inputs.keyboard.two
  args.outputs.sounds << "/sounds/lightsaber0mp3.mp3" if args.inputs.keyboard.key_up.enter 
end


class Cam #sprite not deepcopy
  attr_accessor :ratio, :zeroingX, :zeroingY
  attr_reader :focusX, :focusY, :ratio, :camW, :camH
  def initialize
    @camW = 1280
    @camH = 720
    @focusX = 360
    @focusY = 640
    @ratio = 1

    @zeroingX = 0
    @zeroingY = 0

    @shakeStart = 10000
    @shakeRad = 0
    @shakeRand = (rand + 0.02)/2 + 1/2
  end
  def setFocus x, y #focus Point is take center of the cam.
    @focusX = x
    @focusY = y
  end
  def camWork args, sprite #sprite must be hash
    args.gtk.notify! args.state.days
    prevCamError args
    camShake args
    
    spriteInCam = sprite.dup
    #get the sprite's relative pos from cam center point, resize distance by @ratio, make @focusX, Y to be at the center, consider sprite origin (left bottom), move by zeroingX, Y
    spriteInCam[:x] = (spriteInCam[:x] + spriteInCam[:w]/2 - @focusX) * @ratio + @camW/2 - spriteInCam[:w]/2*@ratio - @zeroingX #in cam x
    spriteInCam[:y] = (spriteInCam[:y] + spriteInCam[:h]/2 - @focusY) * @ratio + @camH/2 - spriteInCam[:h]/2*@ratio - @zeroingY #in cam y
    
    spriteInCam[:w] = spriteInCam[:w]*@ratio
    spriteInCam[:h] = spriteInCam[:h]*@ratio
 
    cam = {x:0, y:0, w:@camW, h:@camH}
    if args.geometry.intersect_rect? cam, spriteInCam 
      args.outputs.sprites << spriteInCam
    end
  end
  def prevCamError args
    if @ratio < 0
      @ratio = 0
      args.gtk.notify! 'Cam::prevCamError, ratio cannot less than 0. p to increase ratio'
    end
  end
  def shakeStart args, rad
    @shakeStart = args.state.tick_count
    @shakeRad = rad
  end
  def camShake args #before shakeStart, zeroingX and zeroingY is 1
    duration = 10 #shake duration is duration * 2
    easing0 = args.easing.ease @shakeStart,
    args.state.tick_count,
    duration/2,
    :identity
    easing1 = args.easing.ease @shakeStart + duration, #will attenuation the easing0
    args.state.tick_count,
    duration/2,
    :identity
    easing2 = args.easing.ease @shakeStart + duration,
    args.state.tick_count,
    duration/2,
    :flip
    
    #/ + -/ + \
    @zeroingX = (2*(easing0 - easing1 + easing2) - 1) * 3 * Math::cos(@shakeRad)
    @zeroingY = (2*(easing0 - easing1 + easing2) - 1) * 2 * Math::sin(@shakeRad)
  end
  
  def serialize
    {ratio: ratio, zeroingX: zeroingX, zeroingY: zeroingY}
  end
  def inspect
    serialize.to_s
  end
  def to_s
    serialize.to_s
  end
end


def mousePosInfo args 
  mouseInfo = "mouseX: #{args.inputs.mouse.x}, mouseY: #{args.inputs.mouse.y}"
  args.outputs.labels << { x: 600, y: 600, text: mouseInfo, w:200, h:20 }
end


def textInfo (args, text = '')
  size_enum = 35
  w, h = args.gtk.calcstringbox(text, size_enum, "/fonts/Titillium_Web/TitilliumWeb-SemiBold.ttf") #str, size_enum, font
  args.outputs.labels << {x:640 - w/2, y: 720 - 68 , w:w, h: h, text: text, font: "/fonts/Titillium_Web/TitilliumWeb-SemiBold.ttf", size_enum: size_enum, r:219, g:86, b:97}
end


def doormatScene args
  #args.gtk.hide_cursor
  args.outputs.sprites << [0, 0, 1280, 720, "/sprites/background/doormat.png"]
  args.state.footprintSprite[:path] = args.state.footprintSprite[:ani].loopByTick(args) 
  
  textInfo args, 'running time 3 minute'
  args.state.footprintSprite[:x] += 1 if args.inputs.right
  args.state.footprintSprite[:x] -= 1 if args.inputs.left
  args.state.footprintSprite[:y] += 1 if args.inputs.up
  args.state.footprintSprite[:y] -= 1 if args.inputs.down
  
  
  wasdGuide = "use wasd/arrow keys to move. use Arrow to move"
  args.outputs.labels << { x: 500, y: 200, text: "go to mini doormat, q to open the door", w:2000, h:20, font:"/fonts/Titillium_Web/TitilliumWeb-ExtraLight.ttf", size_enum: 15, r:143, g:84, b:7}
  args.outputs.labels << { x: 200, y: 200, text: "running time 3 minute.", w:2000, h:20, font:"/fonts/Titillium_Web/TitilliumWeb-ExtraLight.ttf", size_enum: 15, r:143, g:84, b:7}
  doormat = {x:600, y:430, w:80, h:45, path:"/sprites/background/doormat.png"}
  doormatDoor = {x:610, y:475, w:60, h:80, path:args.state.doormatDoorAni.aniNow}
  if args.state.footprintSprite.inside_rect? doormat
    args.state.creakSound.playSound(args)
    args.state.doormatDoorAni.cycleByTick(args) 
    args.gtk.stop_music
    if args.inputs.keyboard.key_up.q
      args.gtk.stop_music
      args.state.scene = "cinderellaRoom" 
    end
  end
  
  args.outputs.sprites << doormat
  args.outputs.borders << doormat
  args.outputs.sprites << doormatDoor 
  args.outputs.sprites << args.state.footprintSprite 
end


def cinderellaRoom args
  args.gtk.show_cursor
  args.outputs.sounds << "/sounds/cinderella/snoring.mp3"
  args.outputs.background_color = [21, 8, 22]
  args.state.sceneCloser.closing = false if args.state.sceneCloser[:y] <= -720 * 3/2
  args.state.sceneCloser[:y] -= 4 if args.state.sceneCloser.closing == true
  
  dark = {x:0, y:0,w:1280,h:720, path:"/sprites/light/dark.png"}
  args.outputs.sprites << [1280-600, 720-450, 600, 450, args.state.bgCinderellaSleepingAni.cycleByTick(args)]
  args.outputs.sprites << [-100 + rand, 300 + rand ,200, 500, "/sprites/tree.png"]
  args.outputs.sprites << [0 + rand, 300 + rand ,400, 700, "/sprites/tree.png"]
  args.outputs.sprites << [100 + rand, 300 + rand ,200, 500, "/sprites/tree.png"]
  args.outputs.sprites << [500 + rand, 300 + rand ,400, 700, "/sprites/tree.png"]
  args.outputs.sprites << [200 + rand, 300 + rand ,500, 900, "/sprites/tree.png"]
  args.outputs.sprites << [300 + rand, 300 + rand ,300, 600, "/sprites/tree.png"]
  args.outputs.sprites << [500 + rand, 300 + rand ,400, 600, "/sprites/tree.png"]
  
  switch = {x:300, y:270, w:50, h:50, path:"/sprites/switch.png"}
  if args.state.baymax.sprite.intersect_rect? switch 
    textInfo args, 'q to switch light' if args.state.light == false
    if args.inputs.keyboard.key_up.q
      args.state.light = !args.state.light 
      args.outputs.sounds << "/sounds/switch.wav"
      args.state.baymax.baymaxStat[:memoryTick] = args.state.tick_count if args.state.light == true
    end
  end
  
  args.outputs.sprites << switch
  args.outputs.sprites << args.state.baymax.sprite
  args.state.baymax.activate(args)
  args.outputs.sprites << [args.state.baymax.sprite[:x] - 1280 + 200, args.state.baymax.sprite[:y] - 720 + 45, 1280*2, 720*2, "/sprites/light/light0.png"] if args.inputs.keyboard.c
  
  args.outputs.sprites << {x: 1000, y: 200, w: 148, h:200, path:args.state.greenDoorAni.aniNow}
  args.state.greenDoorAni.loopByTick(args) if args.state.tick_count > args.state.baymax.baymaxStat[:memoryTick] + 500 and args.state.light == true and args.state.greenDoorAni.index != 22
  
  args.outputs.sprites << dark if args.state.light == false
  
  if args.state.greenDoorAni.index == 22
    args.outputs.sounds << "/sounds/gummy.wav" if args.state.sceneCloser[:y] == 700
    args.outputs.sprites << args.state.sceneCloser 
    args.state.sceneCloser.closing = true
    args.outputs.sounds << "/sounds/goat.wav" if args.state.sceneCloser[:y] == 0 # monitor not fully covered
  end
  if args.state.sceneCloser[:y] <= -180
    args.state.scene = "goatFight"
  end 
end


def goatFight args #scene
  args.gtk.stop_music
  b = args.state.tick_count/10 % 255
  smoothB = Math::sin((360*b/255)*Math::PI/180) * 128 + 127
  if smoothB >= 0
    r = 20 + smoothB/3*2
    g = 20 + smoothB/3*2
  else
    r = 20
    g = 20
  end
  args.outputs.background_color = [r, g, smoothB]
  sunX = 640 * Math::sin((360*b/255 - 90)*Math::PI/180) + 640
  sunY = 360 * Math::cos((360*b/255 - 90)*Math::PI/180) + 360
  moonX = 1280-sunX #moon pos is opposite of sun pos
  moonY = 720-sunY
  
  args.outputs.sprites << {x:sunX - 250, y:sunY - 250, w:500, h:500, path:"/sprites/background/sun2.png"}
  args.outputs.sprites << {x:moonX - 250, y:moonY - 250, w:500, h:500, path:"/sprites/background/moon0.png"}
  
  focusX = args.state.baymax.sprite[:x] + args.state.baymax.sprite[:w]/2
  focusY = args.state.baymax.sprite[:y] + args.state.baymax.sprite[:h]/2
  args.state.cam.camWork args, {x: 0, y: 0, w: 1280, h: 720, path: "/sprites/background/goatFight.png"}
  args.state.cam.camWork args, args.state.genBreaks.sprite
  
  args.state.genBreaks.activate args
  
  args.state.sceneCloser.closing = false if args.state.sceneCloser[:y] <= -720 * 3/2
  text = ''
  text = "f to fly, press spacebar to attack" if args.state.baymax.baymaxStat[:fly] != true
  text = "falling. restart or press p/m to cam resize" if args.state.baymax.baymaxStat[:battery] <= 0
  if args.state.bad.goat.trap > 0
    text =  "hit left or right rapidly. goat.trap: #{args.state.bad.goat.trap}, battery#{args.state.baymax.baymaxStat[:battery]}"
    args.state.baymax.sprite[:x] = 200 
    args.state.baymax.sprite[:y] = 500
  end
  textInfo args, text
  args.state.cam.setFocus focusX, focusY
  args.state.baymax.sprite[:y] -= args.state.g
  
  args.state.baymax.activate args
  
  args.state.bad.goat.trap -= 1 if args.inputs.keyboard.key_up.left or args.inputs.keyboard.key_up.right
  redRect0 = {x:args.state.baymax.sprite[:x], y:args.state.baymax.sprite[:y], w:args.state.baymax.sprite[:w], h:args.state.baymax.sprite[:h]*args.state.baymax.baymaxStat[:battery]/100, path:"/sprites/redRect.png"}
  redRect1 = {x:args.state.bad.goat.sprite[:x], y:args.state.bad.goat.sprite[:y], w:args.state.bad.goat.sprite[:w], h: args.state.bad.goat.sprite[:h]*(args.state.bad.goat.stat[:health]/66), path:"/sprites/redRect.png"}
  greenFrame = {x:args.state.baymax.sprite[:x], y:args.state.baymax.sprite[:y], w:args.state.baymax.sprite[:w], h:args.state.baymax.sprite[:h], path:"/sprites/greenFrame.png"}
  args.state.cam.camWork args, redRect1
  if args.state.bad.goat.stat[:health] > 0
    args.state.cam.camWork args, args.state.bad.goat.sprite
    args.state.bad.goat.activate args
  end
  args.gtk.notify! "game over" if args.state.bad.goat.stat[:health] < 0
  args.state.cam.camWork args, redRect0
  args.state.cam.camWork args, greenFrame
  args.state.cam.camWork args, args.state.baymax.sprite
  if args.state.sceneCloser.closing == true
    args.state.sceneCloser[:y] -= 3 
    args.outputs.sprites << args.state.sceneCloser
  end
  
  args.state.cam.ratio += 0.01 if args.inputs.keyboard.p
  args.state.cam.ratio -= 0.01 if args.inputs.keyboard.m
  args.state.cam.zeroingY += 1 if args.inputs.keyboard.one
  args.state.cam.zeroingY -= 1 if args.inputs.keyboard.two
end


class Goat
  attr_reader :power, :trap, :sprite, :stat
  attr_accessor :trap
  def initialize
    @power = 1
    @trap = 20
    
    @root = "/sprites/boss/goat/default.png"
    @aniTwig = AniTwig.new([@root])
    @aniChew = Ani.new([
      "/sprites/boss/goat/chewing/chewing0.png",
      "/sprites/boss/goat/chewing/chewing1.png",
      "/sprites/boss/goat/chewing/chewing2.png",
      "/sprites/boss/goat/chewing/chewing3.png",
      "/sprites/boss/goat/chewing/chewing4.png"
      ], 5)
      @aniSpit = Ani.new([
        "/sprites/boss/goat/spit/spit01.png",
        "/sprites/boss/goat/spit/spit02.png",
      "/sprites/boss/goat/spit/spit03.png",
      "/sprites/boss/goat/spit/spit04.png",
      "/sprites/boss/goat/spit/spit05.png",
      "/sprites/boss/goat/spit/spit06.png",
      "/sprites/boss/goat/spit/spit07.png",
      "/sprites/boss/goat/spit/spit08.png",
      "/sprites/boss/goat/spit/spit09.png",
      "/sprites/boss/goat/spit/spit10.png",
      "/sprites/boss/goat/spit/spit11.png",
      "/sprites/boss/goat/spit/spit12.png",
      "/sprites/boss/goat/spit/spit13.png",
      "/sprites/boss/goat/spit/spit14.png"
      ], 5)
      @leafAniChew = [@root, @aniChew]
      @leafAniSpit = [@root, @aniSpit]
      
    @leafArr = [@leafAniChew]
    @randLeaf = [@leafAniChew]
    
    @sprite = {x: 830, y: 266, w:62*4, h:71*4, path:@root, dx: 0, dy: 0, flip_horizontally: false}
    @stat = {health: 66}
    @gun = Gun.new
    @randAniTimer = Timer.new(100)
    @spitTimer = Timer.new(5)
    @randMoveTimer = Timer.new(200)
  end
  def activate args
    if args.state.baymax.sprite[:x] + args.state.baymax.sprite[:w]/2 <  @sprite[:x] + @sprite[:w]/2
      @sprite[:flip_horizontally] = false
    else
      @sprite[:flip_horizontally] = true
    end
    @leafArr.push(@leafAniSpit) if @trap <= 0 and @leafArr.include?(@leafAniSpit) != true
    if @randAniTimer.timerTickEnd args
      @randLeaf = @leafArr[((@leafArr.length - 1 ) * rand).round]
    end 
    @sprite[:path] = @aniTwig.loopByTick(args, @randLeaf) 
    if @sprite[:path] == "/sprites/boss/goat/spit/spit09.png" and @spitTimer.timerTickEnd args
      loadSpit args
      args.outputs.sounds << "/sounds/gummy.wav"
    end
    @gun.shoot args
    randMove args #if @sprite[:y] == 720/360
  end
  
  def randMove args
    @sprite[:dx], @sprite[:dy] = 1-rand*2,1-rand*2 if @randMoveTimer.timerTickEnd args
    @sprite[:dx] = -@sprite[:dx] if @sprite[:x] < 0 or @sprite[:x] + @sprite[:w] > 1280
    @sprite[:dy] = -@sprite[:dy] if @sprite[:y] < 0 or @sprite[:y] + @sprite[:h] > 720
    @sprite[:x] += @sprite[:dx]
    @sprite[:y] += @sprite[:dy]
  end
  
  def loadSpit args
    baymaxPoint = [args.state.baymax.sprite[:x] + args.state.baymax.sprite[:w]/2, args.state.baymax.sprite[:y] + args.state.baymax.sprite[:h] /2]
    if @sprite[:flip_horizontally] == false
      goatMouth = [@sprite[:x] + 20, @sprite[:y] + 35]
    else
      goatMouth = [@sprite[:x] + @sprite[:w] - 20, @sprite[:y] + 35]
    end
    spitAngle = args.geometry.angle_to goatMouth, baymaxPoint
    dx = Math.cos (spitAngle*Math::PI/180)
    dy = Math.sin (spitAngle*Math::PI/180)
    
    spit = {
      x: goatMouth[0], y:goatMouth[1], w:50, h:21,
      dx: dx, dy: dy, 
      power:2, path:"/sprites/boss/goat/spit.png", angle: spitAngle
    }
    spitBullet = Bullet.new(spit)
    @gun.load spitBullet
  end

  def serialize #as dragonRuby tool mentioned
    { }
  end
  def to_s
    serialize.to_s
  end
  def inspect
    serialize.to_s
  end
end


class Bullet
  attr_reader :x, :y, :w, :h, :dx, :dy, :path, :power, :angle
  attr_accessor :x, :y, :w, :h, :dx, :dy, :path, :power, :angle
  def initialize (bullet)
    @x = bullet[:x]
    @y = bullet[:y]
    @w = bullet[:w]
    @h = bullet[:h]
    
    @dx = bullet[:dx]
    @dy = bullet[:dy]
    
    @power = bullet[:power]
    @path = bullet[:path]
    @angle = bullet[:angle]
  end
end


class Gun
  attr_reader :bullets
  def initialize
    @bullets = []
  end
  def load bullet #must instance of Bullet
    @bullets.push(bullet)
  end
  def shoot args, soundEffect="/sounds/baymax/dialEdited.wav", target=args.state.baymax 
    @bullets.each {|bullet|
      bullet.x += bullet.dx
      bullet.y += bullet.dy
      maxRect = {x:0, y:0, w: 1280, h:720}
      
      bulletHash = {x:bullet.x, y:bullet.y, w:bullet.w, h:bullet.h, 
        dx:bullet.dx, dy:bullet.dy, 
        power:bullet.power, path:bullet.path, angle:bullet.angle}
        
        if args.geometry.intersect_rect? target.sprite, bulletHash
          args.outputs.sounds << soundEffect
          @bullets -= [bullet]
          if target == args.state.baymax
            bulletRad = Math::atan2(bullet.dy, bullet.dx)
          args.state.cam.shakeStart args, bulletRad
          
          args.state.baymax.baymaxStat[:battery] -= 20
          args.outputs.sounds << "/sounds/baymax/lowBattery.wav" if args.state.baymax.baymaxStat[:battery] < 20
        else
          target.stat.health -= bulletHash[:power]
        end
        return
      end
      
      if (args.geometry.intersect_rect? maxRect, bulletHash) != true
        @bullets -= [bullet]
        return
      end
      #args.outputs.sprites << bulletHash
      args.state.cam.camWork args, bulletHash
    }
  end
  
  def serialize
    {}
  end
  def inspect
    serialize.to_s
  end
  def to_s
    serialize.to_s
  end
end


class Baymax #sprite default dir is right
  attr_accessor :sprite, :baymaxStat, :moveSound
  
  def initialize
    @baymaxAniTwig = AniTwig.new(["/sprites/baymaxSprite0.png"])
    @aniBendPathArr = [
      "/sprites/baymax/aniBend/bend0.png",
      "/sprites/baymax/aniBend/bend1.png",
      "/sprites/baymax/aniBend/bend2.png",
      "/sprites/baymax/aniBend/bend3.png",
      "/sprites/baymax/aniBend/bend4.png",
      "/sprites/baymax/aniBend/bend5.png",
      "/sprites/baymax/aniBend/bend6.png",
      "/sprites/baymax/aniBend/bend7.png",
    ]
    @aniWalkPathArr = [
      "/sprites/baymax/aniWalk/walk0.png",
      "/sprites/baymax/aniWalk/walk1.png",
      "/sprites/baymax/aniWalk/walk2.png",
      "/sprites/baymax/aniWalk/walk3.png",
      "/sprites/baymax/aniWalk/walk4.png",
      "/sprites/baymax/aniWalk/walk5.png",
      "/sprites/baymax/aniWalk/walk6.png",
      "/sprites/baymax/aniWalk/walk7.png",
      "/sprites/baymax/aniWalk/walk8.png",
      "/sprites/baymax/aniWalk/walk9.png",
      "/sprites/baymax/aniWalk/walk10.png",
    ]
    @aniFlyPathArr = [
      "/sprites/baymax/flight/flight0.png",
      "/sprites/baymax/flight/flight1.png",
      "/sprites/baymax/flight/flight2.png",
      "/sprites/baymax/flight/flight3.png",
    ]
    @aniFly = Ani.new(@aniFlyPathArr, 5)
    @aniBend = Ani.new(@aniBendPathArr, 10)
    @aniWalk = Ani.new(@aniWalkPathArr, 10)
    @leafRoot = ["/sprites/baymaxSprite0.png"]
    @leafAniWalk = ["/sprites/baymaxSprite0.png", @aniWalk]
    @leafAniBend = ["/sprites/baymaxSprite0.png", @aniBend]
    @leafAniFly = ["/sprites/baymaxSprite0.png", @aniFly]
    @moveSound = PlaySound.new("/sounds/baymax/balloon0.wav", 20)
    @grabSound = PlaySound.new("/sounds/baymax/bell0ver0.wav", 50)
    @flySound = PlaySound.new("/sounds/baymax/fly.wav",10)
    @baymaxStat = {:battery=>100, :walk => true, :fly =>false, :pick => false, :toLeft => false, :memoryTick => 0}
    @sprite = {:x => 200, :y => 200, :w => 70, :h => 90, dx:1, dy:1, :path => "/sprites/baymaxSprite0.png", flip_horizontally: false}
    
    @recordTimer = Timer.new(5)
    @recordPos = [[200,200], [200,200], [200,200], [200,200], [200,200], [200,200], [200,200], [200,200], [200,200], [200,200]]
    @recordDX = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @gun = Gun.new
    @gunTimer = Timer.new(200)
  end

  def baymaxAniTwigIf args #used with act def 
    if @baymaxAniTwig.aniTwig.twigNow == ["/sprites/baymaxSprite0.png"] and @baymaxStat[:walk] == true
      @sprite[:h] = 90
      @sprite[:w] = 70
    end
    if @baymaxAniTwig.aniTwig.twigNow == @leafAniWalk and @baymaxStat[:walk] == true
      @sprite[:h] = 90
      @sprite[:w] = 50
      if (@aniWalk.index == 7 or @aniWalk.index == 2) and (args.inputs.keyboard.directional_vector)
        @moveSound.playSound(args)
      end
    end
    if @baymaxAniTwig.aniTwig.twigNow == @leafAniWalk and @baymaxStat[:walk] == true
      @sprite[:h] = 90
      @sprite[:w] = 50
      if (@aniWalk.index == 7 or @aniWalk.index == 2) and (args.inputs.keyboard.directional_vector)
        @moveSound.playSound(args)
      end
    end
    if @baymaxAniTwig.aniTwig.twigNow == @leafAniRBend and @baymaxStat[:walk] == true
      @sprite[:h] = 85
    end
    if @baymaxAniTwig.aniTwig.twigNow == @leafAniFly
      @sprite[:w] = 50 * 3
      @sprite[:h] = 28 * 3
    end
  end 
  
  def actWalk args
    if @sprite[:x] <= 0
      args.state.warnSound.playSound args
      @sprite[:x] = 1
      return
    end
    if @sprite[:x] > 1280 - @sprite[:w]
      args.state.warnSound.playSound args
      @sprite[:x] = 1280 - 1 - @sprite[:w]
      return
    end  
    if (args.inputs.left and args.inputs.right) or (args.inputs.up and args.inputs.down)
      return #no move no sounds
    end
    if args.inputs.left
      @baymaxStat[:toLeft] = true
      @sprite[:flip_horizontally] = true
      @sprite[:path] = @baymaxAniTwig.loopByTick(args, @leafAniWalk)
      @sprite[:x] -= @sprite[:dx]
    end
    if args.inputs.right
      @baymaxStat[:toLeft] = false
      @sprite[:flip_horizontally] = false
      @sprite[:path] = @baymaxAniTwig.loopByTick(args, @leafAniWalk)
      @sprite[:x] += @sprite[:dx]
    end
  end
  
  def actFly args
    @flySound.playSound args
    @sprite[:y] += args.state.g if @baymaxStat[:battery] > 0
    @sprite[:path] = @baymaxAniTwig.cycleByTick args, @leafAniFly
    if @sprite[:flip_horizontally] == true
      bullet = {x:@sprite[:x] + 50, y:@sprite[:y], w:50, h:25, dx:-2, dy:0, power:2, path: "/sprites/baymax/bullet.png"}
    else
      bullet = {x:@sprite[:x] + 50, y:@sprite[:y], w:50, h:25, dx:2, dy:0, power:2, path: "/sprites/baymax/bullet.png"}
    end
    if args.inputs.keyboard.key_up.space 
      @gun.load bullet if @gunTimer.timerTickEnd args
    end
    @gun.shoot args, "/sounds/baymax/balloon.wav", args.state.bad.goat 
    
    if args.inputs.right
      @sprite[:flip_horizontally] = false
      @sprite[:x] += @sprite[:dx] if args.inputs.right
    end
    if args.inputs.left
      @sprite[:flip_horizontally] = true
      @sprite[:x] -= @sprite[:dx] if args.inputs.left
    end
    if args.inputs.down
      @sprite[:y] -= @sprite[:dy]
    end
    if args.inputs.up
      @sprite[:y] += @sprite[:dy]
    end
  end
  
  def manipulateD args
    if @recordTimer.timerTickEnd args
      @recordPos.push [@sprite[:x] + @sprite[:w]/2, @sprite[:y] + @sprite[:h]/2]
      @recordPos.shift
      @recordDX.push (Math.sqrt((@recordPos[-1][0] - @recordPos[-2][0])**2))/3*2
      @recordDX.shift
    end
    maniD = (@recordDX.inject(0, &:+)  / @recordDX.length).abs + 0.5
    @sprite[:dx] = maniD if maniD < 4
  end
  
  def activate args
    baymaxAniTwigIf args
    
    if args.inputs.keyboard.key_up.f
      args.outputs.sounds << "/sounds/baymax/inigtion.wav" 
      @baymaxStat[:fly] = !@baymaxStat[:fly]
      @baymaxStat[:walk] = !@baymaxStat[:walk]
    end
    
    if @baymaxStat[:walk] === true
      actWalk args
    end
    if @baymaxStat[:fly] === true
      manipulateD args
      actFly args
    end
  end
  
  
  def serialize
    {sprite: sprite, baymaxStat: baymaxStat, moveSound: moveSound}
  end
  def inspect
    serialize.to_s
  end
  def to_s
    serialize.to_s
  end
end


class GenBreaks
  attr_reader :sprite
  def initialize
    @pathArr = ["/sprites/square/black.png", "/sprites/square/blue.png", "/sprites/square/red.png", "/sprites/square/green.png"]
    @index = 0
    randX = (rand*1280).ceil - 200
    randY = (rand*720).ceil - 200
    randW = (50 + 30*rand).round
    randH = (50 * 30*rand).round
    @sprite = {x: randX, y: randY, w: randW, h: randH, dx: -2+rand*4, dy: -2 +rand*4, path: @pathArr[@index]}
    @timer = Timer.new(1000)
  end
  def reGen
    @index = (@index + 1) % @pathArr.length
    @sprite = {x: rand*1280, y: rand*720, h: 50 + 20*rand, w:50 + 20*rand, dx: -2+rand*4, dy: -2+rand*4, path: @pathArr[@index]}
  end
  def activate args
    @sprite[:x] += @sprite[:dx]
    @sprite[:y] += @sprite[:dy]

    @sprite[:dx] = -@sprite[:dx] if @sprite[:x] < 0 or @sprite[:x] + @sprite[:w] > 1280
    @sprite[:dy] = -@sprite[:dy] if @sprite[:y] < 0 or @sprite[:y] + @sprite[:h] > 720

    if args.geometry.intersect_rect? args.state.baymax.sprite, @sprite
      args.state.baymax.baymaxStat[:battery] += 10
      args.outputs.sounds << "/sounds/baymax/break.wav"
      reGen
    end

    if @timer.timerTickEnd args
      reGen
    end
  end

  def serialize
    {}
  end
  def inspect 
    serialize.to_s 
  end
  def to_s 
    serialize.to_s
  end
end


class Ani
  attr_reader :cutT, :pathArr, :pathArrLen, :timer
  attr_accessor :index
  def initialize(pathArr, t)
    @pathArr = pathArr
    @pathArrLen = @pathArr.length
    
    @timer = Timer.new(t)
    
    @index = 0
    @k = 1
  end
  def loopByTick args
    return @pathArr[0] if @pathArr.length == 1
    if @timer.timerTickEnd(args) == true
      @index += @k
      if @index > @pathArrLen - 1 
        @index = 0
      end
    end
    return @pathArr[@index]
  end
  def cycleByTick args
    return @pathArr[0] if @pathArr.length == 1
    if (@index + @k > (@pathArrLen-1)) or (@index + @k < 0)
      @k = -@k
    end
    if @timer.timerTickEnd(args) == true
      @index += @k
    end
    return @pathArr[@index]
  end
  def backByTick args
    return @pathArr[0] if @pathArr.length == 1
    @index -= 1 if @index > 0 and @timer.timerTickEnd(args) == true
    return @pathArr[@index]
  end
  def aniNow
    return @pathArr[@index]
  end
  def timer=(t)
    @timer = t if t.instance_of? Timer
  end
  
  def serialize #as dragonRuby tool mentioned
    { }
  end
  def to_s
    serialize.to_s
  end
  def inspect
    serialize.to_s
  end
end


class AniTwig
  attr_reader :aniTwig
  def initialize (twig=[])
    @aniTwig = Twig.new(twig)
  end
  def toAniLeaf args, aniLeaf # @aniTwig.toLeaf by condition
    return @aniTwig.twigNow[-1] if @aniTwig.twigNow == aniLeaf and @aniTwig.turned == true
    if @aniTwig.twigNow[-1].instance_of?(Ani) == false
      @aniTwig.toLeaf(aniLeaf)
      return @aniTwig.twigNow[-1].aniNow if @aniTwig.twigNow[-1].instance_of? Ani
      return @aniTwig.twigNow[-1]
    end
    if @aniTwig.twigNow[-1].instance_of? Ani
      if (@aniTwig.turned == true and @aniTwig.twigNow[-1].index == @aniTwig.twigNow[-1].pathArrLen - 1)
        @aniTwig.toLeaf (aniLeaf)
        return @aniTwig.twigNow[-1].aniNow if @aniTwig.twigNow[-1].instance_of? Ani
        return @aniTwig.twigNow[-1]
      end
      if @aniTwig.turned == true
        @aniTwig.twigNow[-1].loopByTick (args)
        return @aniTwig.twigNow[-1].aniNow
      end
      if (@aniTwig.turned != true and @aniTwig.twigNow[-1].index == 0)
        @aniTwig.toLeaf(aniLeaf)
        return @aniTwig.twigNow[-1].aniNow if @aniTwig.twigNow[-1].instance_of? Ani
        return @aniTwig.twigNow[-1]
      end
      if @aniTwig.turned != true
        @aniTwig.twigNow[-1].backByTick (args)
        return @aniTwig.twigNow[-1].aniNow
      end
    end
  end
  def cycleByTick args, aniLeaf #animate cycleByTick if fully animated to end of aniLeaf
    @aniTwig.twig0Check aniLeaf
    if @aniTwig.twigNow == aniLeaf and @aniTwig.turned == true and @aniTwig.twigNow [-1].instance_of? Ani
      return @aniTwig.twigNow[-1].cycleByTick args
    end
    return toAniLeaf args, aniLeaf
  end
  def loopByTick args, aniLeaf #animate loopByTick if fully animated to ends of aniLeaf
    @aniTwig.twig0Check aniLeaf
    if @aniTwig.twigNow == aniLeaf and @aniTwig.turned == true and @aniTwig.twigNow [-1].instance_of? Ani
      return @aniTwig.twigNow[-1].loopByTick args
    end
    return toAniLeaf args, aniLeaf
  end
end


class Twig #leaf should Arr
  attr_reader :interTwig, :preLeaf, :twigNow, :turned
  attr_accessor :twigNow
  def initialize (twig=[])
    @interTwig = []
    @preLeaf = []
    @twigNow = twig
    @turned = false
  end
  def getInterTwig leafPathArr
    @interTwig = []
    leafPathArr.each_index {
      |i|
      return @interTwig if @twigNow.length <= i or @twigNow[i].nil?
      return @interTwig if @twigNow[i] != leafPathArr[i]
      @interTwig.push(leafPathArr[i])
    }
  end
  def twig0Check leafPathArr
    if @preLeaf != leafPathArr
      @preLeaf = leafPathArr
      @turned = false
      @interTwig = getInterTwig(leafPathArr)
    end
    @turned = true if @twigNow == @interTwig
  end
  def toLeaf leafPathArr
    twig0Check leafPathArr
    @twigNow.push(leafPathArr[@twigNow.length]) if (@turned == true) and (@twigNow != leafPathArr)
    @twigNow.pop() if @turned == false
    return @twigNow
  end
end


class Timer
  attr_accessor :startedTick, :limitT
  #attr_accessor :limitT, :playedAt
  def initialize(t = 20)
    @limitT = t
    @startedTick = 0
    @count = 0
  end
  def timerTickEnd args
    if (args.state.tick_count - @startedTick >= @limitT) or (@startedTick == 0)
      @startedTick = args.state.tick_count
      return true
    end
  end
  def timerCountEnd
    @count += 1
    if @count >= @limitT
      @count = 0
      return true
    end
  end
  def boolTimerTickEnd args
    return true if (args.state.tick_count - @startedTick >= @limitT) or (@startedTick == 0)
    return false
  end
end


class PlaySound
  attr_reader :timer
  def initialize(path, t)
    @path = path
    @timer = Timer.new(t)
  end
  def playSound args
    if @timer.timerTickEnd(args) == true
      args.outputs.sounds << @path
    end
  end

  def serialize
    {}
  end
  def inspect
    serialize.to_s 
  end
  def to_s
    serialize.to_s 
  end
end
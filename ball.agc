rem
rem BlockZ // ball.agc
rem


rem Define the type for a Ball
type t_Ball
	id as integer
	x as float
	y as float
	vx as float
	vy as float
	diameter as float
	speed as integer
	angle as integer
endtype


rem Initialize the UDT and the sprite for Game Ball
function initBall()
	_ball as t_Ball
	id = createSprite(loadImage("ball.png"))
	_ball.id = id
	_ball.x = 50.0
	_ball.y = 94.0
	_ball.diameter = getSpriteWidth(id)
	_ball.speed = 30
	_ball.angle = randomSign(1) * random(10, 45)
	
	setSpriteShapeCircle(_ball.id, 0.0, -0.6, getSpriteWidth(_ball.id) / 2)
	setSpriteOffset(_ball.id, _ball.diameter / 2, _ball.diameter / 2)
	setSpriteScaleByOffset(_ball.id, 0.1, 0.1)
	setSpritePositionByOffset(_ball.id, _ball.x, _ball.y)
	setSpritePhysicsOn(_ball.id, DYNAMIC)
	setSpritePhysicsRestitution(_ball.id, 0.99)
	
endfunction _ball


rem Launch ball
function launchBall()

	startVect as Vector2D
	startVect = getVectorFromAngle(Ball.angle)
	Ball.vx = startVect.x
	Ball.vy = startVect.y

	setSpritePhysicsVelocity(Ball.id, Ball.vx * Ball.speed, Ball.vy * Ball.speed)
endfunction


rem Update ball behavior
function updateBall()
		
	rem Only update ball behavior when it's moving
	if g_IsBallLaunched = TRUE
		rem Force ball NOT to rotate
		setSpritePhysicsAngularVelocity(Ball.id, 0.0)
		
		rem Get Ball velocity in both axis and update the object
		Ball.vx = getSpritePhysicsVelocityX(Ball.id)
		Ball.vy = getSpritePhysicsVelocityY(Ball.id)
		
		rem Use normalized vector to apply "constant" speed for the ball
		vect as Vector2D
		vect.x = Ball.vx
		vect.y = Ball.vy
		vect = normalizeVector2(vect)
		Ball.vx = vect.x
		Ball.vy = vect.y
		setSpritePhysicsVelocity(Ball.id, Ball.vx * Ball.speed, Ball.vy * Ball.speed)
		
		
		print("Ball.x, Ball.y: " + str(Ball.vx) + ", " + str(Ball.vy))
		print("Normalized vector x, y: " + str(vect.x) + ", " + str(vect.y))
		
	endif
endfunction


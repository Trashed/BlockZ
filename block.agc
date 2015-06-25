
rem
rem BlockZ // block.agc
rem

rem UDT for a Game Block
type t_Block
	id as integer
	x as float
	y as float
	width as float
	height as float
	life as integer
endtype


rem Method to create and return a Block
function initBlocks(bH as integer, bV as integer)

	for i = 0 to bH - 1
		for j = 0 to bV - 1
			_block as t_Block
		
			id = createSprite(0)
			_block.id = id
			_block.width = 8.9
			_block.height = 2.0
			space = calculateBlockSpace(bH, _block.width)
			_block.x = space + i * _block.width + i * space
			_block.y = 0.5 + j * _block.height + j * 0.5
			_block.life = 1
			
			setSpriteSize(_block.id, _block.width, _block.height)
			setSpritePosition(_block.id, _block.x, _block.y)
			setSpritePhysicsOn(_block.id, STATIC)
			setSpriteGroup(_block.id, SPRITE_GROUP_BLOCKS)
			
			rem TODO: Add created block in the array one by one
			GameBlocks[i, j] = _block
			
		next j
	next i
	
endfunction

rem Calculate space between blocks based on number of blocks on x axis and blocks desired width
function calculateBlockSpace(bH as integer, w as float)

	space = (100 - bH * w) / (bH + 1)
endfunction space

rem Check which block in the GameBlocks array gets hit
function checkBlockCollision()
	spriteHitId = getSpriteHitGroup(SPRITE_GROUP_BLOCKS, Ball.x, Ball.y)
endfunction


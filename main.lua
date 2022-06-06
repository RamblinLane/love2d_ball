function love.load()

    -- Setup random number generator
    math.randomseed(os.time())

    -- Get screen information
    screen = {}
    screen.w = love.graphics.getWidth()
    screen.h = love.graphics.getHeight()

    -- Use a function to create the ball
    CreateBall()

    changecolor = 300
end

function love.update(dt)
    UpdateBall()
    
    UpdateColour()
end

function love.draw()
    ball.DrawBall()
end

function SetRandomColour ()
    -- make sure we have a new random seed
    math.randomseed(os.time())
    -- pick a random red, green, blue
    r = math.floor(math.random(0, 255))
    g = math.floor(math.random(0, 255))
    b = math.floor(math.random(0, 255))
    -- set the colour
    love.graphics.setColor (love.math.colorFromBytes(r, g, b))
end

function CreateBall()
    -- Determine a random x and y co-ordinate
    local randX = math.random(12, screen.w-12)
    local randY = math.random(12, screen.h-12)

    -- create a ball object (table)
    ball = {}
    ball.x = randX
    ball.y = randY
    ball.radius = 15
    ball.dx = 2.0
    ball.dy = 2.0

    -- as thid function is small, create it here as part of the ball object
    function ball.DrawBall()
        love.graphics.circle("fill", ball.x, ball.y, ball.radius)
    end
end    

function UpdateBall()
    -- increment ball position
    ball.x = ball.x + ball.dx
    ball.y = ball.y + ball.dy

    -- ensure we bounce off the left and right sides correctly
    -- ie dont go closer than the radius of the ball
    if ball.x < ball.radius or ball.x > screen.w - ball.radius then
        ball.dx = ball.dx * -1
    end

    -- ensure we bounce off the top and bottom correctly
    -- ie dont go closer than the radius of the ball
    if ball.y < ball.radius or ball.y > screen.h - ball.radius then
        ball.dy = ball.dy * -1
    end
end


function UpdateColour()
    -- Changes the colour every random interval
    changecolor = changecolor - 1
    if (changecolor <= 0) then
        -- choose another interval
        changecolor = math.random(50, 750)
        SetRandomColour()
    end
end    
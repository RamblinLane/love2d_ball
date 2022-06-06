function love.load()

    -- Setup random number generator
    math.randomseed(os.time())

    -- Get screen information
    screen = {}
    screen.w = love.graphics.getWidth()
    screen.h = love.graphics.getHeight()

    local ballRadius = 15

    -- Determine a random x and y co-ordinate
    -- -- make sure it is not too close to the border
    local randX = math.random(ballRadius, screen.w-ballRadius)
    local randY = math.random(ballRadius, screen.h-ballRadius)

    -- create a ball object (table)
    ball = {}
    ball.x = randX
    ball.y = randY
    ball.radius = ballRadius
    ball.dx = 2.0
    ball.dy = 2.0
end

function love.update(dt)
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

function love.draw()
    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end

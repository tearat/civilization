readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

i = (text) ->
    console.log text

class Game
    constructor: () ->
        @civ = []
        @day = 1
        
        @civ.push { name: "Хуеград", population: 1 }
        i @civ
    
    turn: () ->
        @born()
        i @civ
        
    dice: (n, max) ->
        if n == @rnd(1,max) then true else false
            
    rnd: (min, max) ->
        res = Math.random() * (max - min) + min
        res = Math.round res
            
    born: () ->
        n = @count_population() * @rnd(1,5)/100
        i n
        n = Math.ceil(n)
        i n
        i "Сегодня родилось #{n} человек! \n"
        max = @civ.length
        target = Math.random() * max
        target = Math.floor target
        @civ[target].population += n
        true
        
    count_population: () ->
        res = 0
        for city in @civ
            res += city.population
        res

class Terminal
    constructor: (game) ->
        i "╔═════════════════════════╗"
        i "║                         ║"
        i "║ Welcome to Civilization ║"
        i "║                         ║"
        i "╚═════════════════════════╝"
        i ""
        @game = game
        @terminal()
    
    terminal: () ->
        readline.question '\n> ', (answer) ->
            # Parser
            parsed = answer.split(" ")
            
            # Parse one-word commands
            #
            if parsed.length == 1
                switch answer
                    when ""
                        input.game.turn()
                        input.terminal()
                        false
                    when "q" then true
                    else 
                        i "Undefined one-word command."
                        input.terminal()
                        false
            false            
#############

game = new Game
input = new Terminal game
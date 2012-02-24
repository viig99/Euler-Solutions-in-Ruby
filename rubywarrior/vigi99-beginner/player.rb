class Player
  	def initialize
  		@health_max = @current_health = @hp_before_last_turn = 20
  		@warrior = @last_command = @rescueDone = nil
  	end

  	def play_turn(warrior)
  		@warrior = warrior
  		updateGlobals
      decideDirectionToMove && return
    	if feel.empty? then
    		hp_in_percentage < 50 ? (weAreBeingHit? ? riskyToMove : enemyBeforeStairs) : (isnextEnemyRanged ? shoot : rangedInSight)
    	else
    		hp_in_percentage >= 50 ? ifWallTurnElseContinue : (weAreBeingHit? ? decideToFightOrFlee : checkCaptiveOrMoveBack)
    	end
  	end

    def decideDirectionToMove
      return false if (!look.map{|x| x.enemy?}.include?(true) && look.map{|x| x.captive?}.include?(true))
      if (look(:backward).map{|x| x.enemy? }.include?(true) || look(:backward).map(&:to_s).include?("Stairs") || look(:backward).map(&:to_s).include?("Captive"))
        if !isnextEnemyRanged
          @warrior.pivot! 
          return true
        end
      end
      false
    end

    def rangedInSight
      ((look[1].enemy? && look[2].enemy?) || look[1].character == 'S') ? shoot : move
    end

    def checkCaptiveOrMoveBack
      feel.captive? ? rescueCaptive : move(:backward)
    end

    def isnextEnemyRanged
      look.each do |enemy|
        return false if (enemy.captive? or enemy.stairs?)
        return true if (enemy.to_s == "Archer" || enemy.to_s == "Wizard")
      end
      false
    end

  	def move(direction=:forward)
  		@warrior.walk!(direction)	
  	end

    def look(direction=:forward)
      @warrior.look(direction)
    end

    def shoot(direction=:forward)
      @warrior.shoot!(direction)
    end

    def enemyBeforeStairs
      (look[1].enemy? && (look[1].character.to_s == 's'  || look[1].character.to_s == 'S') && look[2].stairs?) ? shoot : restUnlessStairs
    end

  	def restUnlessStairs(direction=:forward)
  		feel(direction).stairs? || (feel(direction).empty? && look(direction)[1].stairs? || (look[0].empty? && look[1].empty? && look[2].stairs?)) ? move(direction) : rest
  	end

  	def riskyToMove
  		hp_in_percentage > 30 ? (look[1].enemy? ? shoot : move) : move(:backward)
  	end

  	def feel(direction=:forward)
  		@warrior.feel(direction)
  	end

  	def updateGlobals
  		@hp_before_last_turn = @current_health
  		@current_health = @warrior.health
  	end

  	def decideToFightOrFlee
  		hp_in_percentage > 30 ? attack : ((look[0].character == 'a') ? attack : move(:backward))
  	end

  	def attack(direction=:forward)
  		@warrior.attack!(direction)
	  end

  	def rescueOrAttack(direction=:forward)
  		feel(direction).captive? ? rescueCaptive : attack
  	end

  	def ifWallTurnElseContinue(direction=:forward)
  		feel(direction).wall? ? @warrior.pivot! : rescueOrAttack
  	end

  	def rescueCaptive(direction=:forward)
  		@warrior.rescue!(direction)
  		@rescueDone = true
  	end

    def rest
      @warrior.rest!
    end

    def hp_in_percentage
      (@current_health.to_f/@health_max.to_f) * 100
    end

  	def weAreBeingHit?
  		(@hp_before_last_turn > @current_health) ? true : false
  	end
end
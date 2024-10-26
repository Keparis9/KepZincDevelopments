/*Пример использования

function EFFX_update takes nothing returns nothing 
    local Timer tmr = Timer.expired()
    call DestroyEffect(tmr.e)
    set tmr.e = null
    call tmr.delete()
endfunction

function EFFX takes string eff , real time , unit target, string attach returns nothing
    local Timer tmr = Timer.create()
    set tmr.e = AddSpecialEffectTarget(eff, target,attach)
    call tmr.start(time, false, function EFFX_update)
endfunction

*/



library LibTimer
struct Timer
    timer t
    unit target
    unit u
    unit m
    unit dummy
    group g
    effect e 
    Timer tmr 
    boolean bool
    string order
    integer index
    integer kolvo
    integer abi
    integer table
    integer count
    integer tick
    integer cur
    integer i
    integer level
    integer id
    integer agi
    integer str
    string sid
    real restore
    real r
    real targetlifepercent
    real dmgulifepercent
    real damage
    real radius
    real dist
    real time
    real ptime
    real speed
    real scale
    real agl
    real x
    real dx
    real tx
    real y
    real dy
    real ty
    real z
    boolean aginorm
    boolean strnorm

    
    private static hashtable H = InitHashtable()
    
    static method create takes nothing returns thistype
        local thistype n = thistype.allocate()
        set n.t = CreateTimer()
        call SaveInteger(H, 0, GetHandleId(n.t), n)
        return n
    endmethod
    
    method start takes real time, boolean periodic, code func returns nothing
        call TimerStart(.t, time, periodic, func)
    endmethod
    
    method pause takes nothing returns nothing
        call PauseTimer(.t)
    endmethod
    
    method destroy takes nothing returns nothing
        call PauseTimer(.t)
        call DestroyTimer(.t)
        set .t = null
        call .deallocate()
    endmethod
    
    method delete takes nothing returns integer
        call .destroy()
        return 0
    endmethod
    
    static method timer2Timer takes timer t returns thistype
        return LoadInteger(H, 0, GetHandleId(t))
    endmethod
    
    static method expired takes nothing returns thistype
        return LoadInteger(H, 0, GetHandleId(GetExpiredTimer()))
    endmethod
    

endstruct
endlibrary

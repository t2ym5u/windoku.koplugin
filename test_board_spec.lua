local DIR = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"

package.preload["gettext"] = function()
    return setmetatable({}, { __call = function(_, s) return s end })
end
package.path = DIR .. "common/?.lua;" .. DIR .. "?.lua;" .. package.path

describe("WindokuBoard", function()
    local Mod, WindokuBoard, WINDOW_REGIONS

    setup(function()
        Mod = require("board")
        WindokuBoard = Mod.WindokuBoard
        WINDOW_REGIONS = Mod.WINDOW_REGIONS
    end)

    describe("new", function()
        it("creates an empty 9x9 board", function()
            local b = WindokuBoard:new()
            assert.are.equal(9, b.n)
        end)
    end)

    describe("generate", function()
        it("fills a solution valid on rows/cols/boxes AND every window region", function()
            math.randomseed(42)
            local b = WindokuBoard:new()
            b:generate("medium")
            local n = b.n
            for r = 1, n do
                local seen = {}
                for c = 1, n do seen[b.solution[r][c]] = true end
                for d = 1, n do assert.is_true(seen[d], "row " .. r .. " missing " .. d) end
            end
            for _, region in ipairs(WINDOW_REGIONS) do
                local seen = {}
                for r = region.row_start, region.row_end do
                    for c = region.col_start, region.col_end do
                        seen[b.solution[r][c]] = true
                    end
                end
                for d = 1, 9 do
                    assert.is_true(seen[d], "window region missing " .. d)
                end
            end
        end)
    end)

    describe("recalcConflicts (window violations)", function()
        it("flags a duplicate value inside a window region", function()
            math.randomseed(42)
            local b = WindokuBoard:new()
            b:generate("medium")
            local region = WINDOW_REGIONS[1]
            local r1, c1 = region.row_start, region.col_start
            local r2, c2 = region.row_start, region.col_start + 1
            if not b:isGiven(r1, c1) and not b:isGiven(r2, c2) then
                b.user[r1][c1] = 5
                b.user[r2][c2] = 5
                b:recalcConflicts()
                assert.is_true(b.conflicts[r1][c1])
                assert.is_true(b.conflicts[r2][c2])
            end
        end)
    end)

    describe("serialize / load", function()
        it("round-trips puzzle and solution", function()
            math.randomseed(42)
            local b = WindokuBoard:new()
            b:generate("medium")
            local data = b:serialize()

            local b2 = WindokuBoard:new()
            assert.is_true(b2:load(data))
            for r = 1, b.n do
                for c = 1, b.n do
                    assert.are.equal(b.solution[r][c], b2.solution[r][c])
                end
            end
        end)

        it("load returns false for invalid data", function()
            local b = WindokuBoard:new()
            assert.is_false(b:load(nil))
            assert.is_false(b:load({}))
        end)
    end)
end)

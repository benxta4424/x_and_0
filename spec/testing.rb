require './lib/players_class'
require './lib/board_class'
require './main'

describe Players do

    describe '#initialize' do

        context 'creation of a player' do

            let(:user_one){{name:'Ben',mark:'X'}}
            let(:user_two){{name:34141,mark:'0'}}

            subject(:player_class){ described_class.new(user_one[:name],user_one[:mark]) }

            let(:test_three){ described_class.new(user_two[:name],user_two[:mark]) }

            it 'correctly creates a players name' do
                solution=player_class.nume

                expect(solution).to eq(user_one[:name])
            end

            it 'correctly creates a players mark' do
                solution=player_class.alegere

                expect(solution).to eq(user_one[:mark])
            end

            it 'does not accept anything other than string for name' do
                solution=test_three.nume

                expect(solution).not_to be(String)
            end

            it 'does not accept anything other than X or 0 for a mark' do
                solution=test_three.alegere

                expect(solution).to eq('X').or eq('0')
            end
        end
    end
end

describe Board do

    subject(:big_class){Board.new([1,2,3,4,5,6,7,8,9])}
    describe "#display" do 

        context 'testing board for different values' do

        subject(:board_class){ Board.new([1,2,3,4,5,6,7,8,9]) }    
        let(:board_class2){ Board.new([1,2,3,4,5,6]) }
        
             it 'for 9 values' do
                expected_output=<<~OUTPUT
                        .............
                        | 1 | 2 | 3 |
                        .............
                        | 4 | 5 | 6 |
                        .............
                        | 7 | 8 | 9 |
                        ............. 
                        
                        OUTPUT
                
                expect {board_class.display}.to output{expected_output}.to_stdout
            end
            
            it 'for 6 values' do
                expected_output=<<~OUTPUT 
                        .............
                        | 1 | 2 | 3 |
                        .............
                        | 4 | 5 | 6 |
                        .............

                        OUTPUT

                expect{board_class2.display}.to output{expected_output}.to_stdout
            end          
        end
    end

    describe "#update" do

        context 'legal moves' do

            subject(:board_class){ Board.new([1,2,3,4,5,6,7,8,9]) }

            let(:user_input){1}
            let(:marker){'X'}

            it 'is not allowed' do

                allow(board_class).to receive(:is_legal?).and_return(false)

                solution=board_class.update(user_input,marker)

                expect(solution).to eq(false)
            end

            it 'is allowed' do
                allow(board_class).to receive(:is_legal?).and_return(true)

                solution=board_class.update(user_input,marker)

                expect(solution).to eq(true)
            end
        end
    end

    describe "is_legal?" do
        context 'check legal moves' do
            let(:values){[1,16]}

            it 'in bounds' do
                solution=big_class.is_legal?(values[0])

                expect(solution).to eq(true)
            end

            it 'out of bounds' do
                solution=big_class.is_legal?(values[1])

                expect(solution).to eq(false)
            end
        end
    end

    describe "#win?" do

        let(:winner_combo){Board.new(['X','X','X',3,4,5,6,7,8])}
        let(:loser_combo){Board.new(['0','X',2,3,4,5,6,'X','0'])}

        context 'checking winning combos' do

            it 'test invalid combo' do
                solution=loser_combo.win?

                expect(solution).to eq(false)
            end

            it 'test valid combo' do
                solution=winner_combo.win?

                expect(solution).to eq(true)
            end


        end
    end
end
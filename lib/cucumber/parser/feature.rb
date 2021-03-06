module Cucumber
  module Parser
    # TIP: When you hack on the grammar, just delete feature.rb in this directory.
    # Also make sure you have uninstalled all cucumber gems (don't forget xxx-cucumber
    # github gems).
    #
    # Treetop will then generate the parser in-memory. When you're happy, just generate
    # the rb file with tt feature.tt
    module Feature
      include Treetop::Runtime

      def root
        @root || :feature
      end

      include I18n

      include Table

      module Feature0
      end

      module Feature1
        def white
          elements[0]
        end

        def comment
          elements[1]
        end

        def white
          elements[2]
        end

        def tags
          elements[3]
        end

        def white
          elements[4]
        end

        def header
          elements[5]
        end

        def bg
          elements[6]
        end

        def feature_elements
          elements[7]
        end

      end

      module Feature2
        def build
          background = bg.respond_to?(:build) ? bg.build : nil
          Ast::Feature.new(
            background, 
            comment.build, 
            tags.build, 
            header.text_value, 
            feature_elements.build(background)
          )
        end
      end

      def _nt_feature
        start_index = index
        if node_cache[:feature].has_key?(index)
          cached = node_cache[:feature][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_white
        s0 << r1
        if r1
          r2 = _nt_comment
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_tags
              s0 << r4
              if r4
                r5 = _nt_white
                s0 << r5
                if r5
                  s6, i6 = [], index
                  loop do
                    i7, s7 = index, []
                    i8 = index
                    i9 = index
                    r10 = _nt_scenario_outline
                    if r10
                      r9 = r10
                    else
                      r11 = _nt_scenario
                      if r11
                        r9 = r11
                      else
                        r12 = _nt_background
                        if r12
                          r9 = r12
                        else
                          self.index = i9
                          r9 = nil
                        end
                      end
                    end
                    if r9
                      r8 = nil
                    else
                      self.index = i8
                      r8 = SyntaxNode.new(input, index...index)
                    end
                    s7 << r8
                    if r8
                      if index < input_length
                        r13 = (SyntaxNode).new(input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure("any character")
                        r13 = nil
                      end
                      s7 << r13
                    end
                    if s7.last
                      r7 = (SyntaxNode).new(input, i7...index, s7)
                      r7.extend(Feature0)
                    else
                      self.index = i7
                      r7 = nil
                    end
                    if r7
                      s6 << r7
                    else
                      break
                    end
                  end
                  r6 = SyntaxNode.new(input, i6...index, s6)
                  s0 << r6
                  if r6
                    r15 = _nt_background
                    if r15
                      r14 = r15
                    else
                      r14 = SyntaxNode.new(input, index...index)
                    end
                    s0 << r14
                    if r14
                      r16 = _nt_feature_elements
                      s0 << r16
                      if r16
                        r18 = _nt_comment
                        if r18
                          r17 = r18
                        else
                          r17 = SyntaxNode.new(input, index...index)
                        end
                        s0 << r17
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Feature1)
          r0.extend(Feature2)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:feature][start_index] = r0

        return r0
      end

      module Tags0
        def tag
          elements[0]
        end

      end

      module Tags1
        def white
          elements[0]
        end

        def ts
          elements[1]
        end
      end

      module Tags2
        def build
          tag_names = ts.elements.map{|e| e.tag.tag_name.text_value}
          Ast::Tags.new(ts.line, tag_names)
        end
      end

      def _nt_tags
        start_index = index
        if node_cache[:tags].has_key?(index)
          cached = node_cache[:tags][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_white
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3, s3 = index, []
            r4 = _nt_tag
            s3 << r4
            if r4
              s5, i5 = [], index
              loop do
                i6 = index
                r7 = _nt_space
                if r7
                  r6 = r7
                else
                  r8 = _nt_eol
                  if r8
                    r6 = r8
                  else
                    self.index = i6
                    r6 = nil
                  end
                end
                if r6
                  s5 << r6
                else
                  break
                end
              end
              if s5.empty?
                self.index = i5
                r5 = nil
              else
                r5 = SyntaxNode.new(input, i5...index, s5)
              end
              s3 << r5
            end
            if s3.last
              r3 = (SyntaxNode).new(input, i3...index, s3)
              r3.extend(Tags0)
            else
              self.index = i3
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = SyntaxNode.new(input, i2...index, s2)
          s0 << r2
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Tags1)
          r0.extend(Tags2)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:tags][start_index] = r0

        return r0
      end

      module Tag0
        def tag_name
          elements[1]
        end
      end

      def _nt_tag
        start_index = index
        if node_cache[:tag].has_key?(index)
          cached = node_cache[:tag][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        if input.index('@', index) == index
          r1 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('@')
          r1 = nil
        end
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            if input.index(Regexp.new('[^@\\r\\n\\t ]'), index) == index
              r3 = (SyntaxNode).new(input, index...(index + 1))
              @index += 1
            else
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          if s2.empty?
            self.index = i2
            r2 = nil
          else
            r2 = SyntaxNode.new(input, i2...index, s2)
          end
          s0 << r2
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Tag0)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:tag][start_index] = r0

        return r0
      end

      module Comment0
        def comment_line
          elements[0]
        end

        def white
          elements[1]
        end
      end

      module Comment1
        def build
          Ast::Comment.new(text_value)
        end
      end

      def _nt_comment
        start_index = index
        if node_cache[:comment].has_key?(index)
          cached = node_cache[:comment][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          r2 = _nt_comment_line
          s1 << r2
          if r2
            r3 = _nt_white
            s1 << r3
          end
          if s1.last
            r1 = (SyntaxNode).new(input, i1...index, s1)
            r1.extend(Comment0)
          else
            self.index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)
        r0.extend(Comment1)

        node_cache[:comment][start_index] = r0

        return r0
      end

      module CommentLine0
        def line_to_eol
          elements[1]
        end
      end

      def _nt_comment_line
        start_index = index
        if node_cache[:comment_line].has_key?(index)
          cached = node_cache[:comment_line][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        if input.index('#', index) == index
          r1 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('#')
          r1 = nil
        end
        s0 << r1
        if r1
          r2 = _nt_line_to_eol
          s0 << r2
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(CommentLine0)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:comment_line][start_index] = r0

        return r0
      end

      module Background0
        def comment
          elements[0]
        end

        def white
          elements[1]
        end

        def background_keyword
          elements[2]
        end

        def steps
          elements[5]
        end
      end

      module Background1
        def build
          Ast::Background.new(
            comment.build, 
            background_keyword.line,
            background_keyword.text_value, 
            steps.build
          )
         end
      end

      def _nt_background
        start_index = index
        if node_cache[:background].has_key?(index)
          cached = node_cache[:background][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_white
          s0 << r2
          if r2
            r3 = _nt_background_keyword
            s0 << r3
            if r3
              s4, i4 = [], index
              loop do
                r5 = _nt_space
                if r5
                  s4 << r5
                else
                  break
                end
              end
              r4 = SyntaxNode.new(input, i4...index, s4)
              s0 << r4
              if r4
                i6 = index
                s7, i7 = [], index
                loop do
                  r8 = _nt_eol
                  if r8
                    s7 << r8
                  else
                    break
                  end
                end
                if s7.empty?
                  self.index = i7
                  r7 = nil
                else
                  r7 = SyntaxNode.new(input, i7...index, s7)
                end
                if r7
                  r6 = r7
                else
                  r9 = _nt_eof
                  if r9
                    r6 = r9
                  else
                    self.index = i6
                    r6 = nil
                  end
                end
                s0 << r6
                if r6
                  r10 = _nt_steps
                  s0 << r10
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Background0)
          r0.extend(Background1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:background][start_index] = r0

        return r0
      end

      module FeatureElements0
        def build(background)
          elements.map{|s| s.build(background)}
        end
      end

      def _nt_feature_elements
        start_index = index
        if node_cache[:feature_elements].has_key?(index)
          cached = node_cache[:feature_elements][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_scenario
          if r2
            r1 = r2
          else
            r3 = _nt_scenario_outline
            if r3
              r1 = r3
            else
              self.index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)
        r0.extend(FeatureElements0)

        node_cache[:feature_elements][start_index] = r0

        return r0
      end

      module Scenario0
        def comment
          elements[0]
        end

        def tags
          elements[1]
        end

        def white
          elements[2]
        end

        def scenario_keyword
          elements[3]
        end

        def name
          elements[5]
        end

        def white
          elements[6]
        end

        def steps
          elements[7]
        end

        def white
          elements[8]
        end
      end

      module Scenario1
        def build(background)
          Ast::Scenario.new(
            background,
            comment.build, 
            tags.build,
            scenario_keyword.line,
            scenario_keyword.text_value, 
            name.text_value, 
            steps.build
          )
        end
      end

      def _nt_scenario
        start_index = index
        if node_cache[:scenario].has_key?(index)
          cached = node_cache[:scenario][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_tags
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_scenario_keyword
              s0 << r4
              if r4
                s5, i5 = [], index
                loop do
                  r6 = _nt_space
                  if r6
                    s5 << r6
                  else
                    break
                  end
                end
                r5 = SyntaxNode.new(input, i5...index, s5)
                s0 << r5
                if r5
                  r7 = _nt_line_to_eol
                  s0 << r7
                  if r7
                    r8 = _nt_white
                    s0 << r8
                    if r8
                      r9 = _nt_steps
                      s0 << r9
                      if r9
                        r10 = _nt_white
                        s0 << r10
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Scenario0)
          r0.extend(Scenario1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:scenario][start_index] = r0

        return r0
      end

      module ScenarioOutline0
        def comment
          elements[0]
        end

        def tags
          elements[1]
        end

        def white
          elements[2]
        end

        def scenario_outline_keyword
          elements[3]
        end

        def name
          elements[5]
        end

        def white
          elements[6]
        end

        def steps
          elements[7]
        end

        def examples_sections
          elements[8]
        end

        def white
          elements[9]
        end
      end

      module ScenarioOutline1
        def build(background)
          Ast::ScenarioOutline.new(
            background,
            comment.build, 
            tags.build,
            scenario_outline_keyword.line, 
            scenario_outline_keyword.text_value, 
            name.text_value, 
            steps.build, 
            examples_sections.build
          )
        end
      end

      def _nt_scenario_outline
        start_index = index
        if node_cache[:scenario_outline].has_key?(index)
          cached = node_cache[:scenario_outline][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_tags
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_scenario_outline_keyword
              s0 << r4
              if r4
                s5, i5 = [], index
                loop do
                  r6 = _nt_space
                  if r6
                    s5 << r6
                  else
                    break
                  end
                end
                r5 = SyntaxNode.new(input, i5...index, s5)
                s0 << r5
                if r5
                  r7 = _nt_line_to_eol
                  s0 << r7
                  if r7
                    r8 = _nt_white
                    s0 << r8
                    if r8
                      r9 = _nt_steps
                      s0 << r9
                      if r9
                        r10 = _nt_examples_sections
                        s0 << r10
                        if r10
                          r11 = _nt_white
                          s0 << r11
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(ScenarioOutline0)
          r0.extend(ScenarioOutline1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:scenario_outline][start_index] = r0

        return r0
      end

      module Steps0
        def build
          elements.map{|e| e.build}
        end
      end

      def _nt_steps
        start_index = index
        if node_cache[:steps].has_key?(index)
          cached = node_cache[:steps][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          r1 = _nt_step
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)
        r0.extend(Steps0)

        node_cache[:steps][start_index] = r0

        return r0
      end

      module Step0
        def comment
          elements[0]
        end

        def step_keyword
          elements[2]
        end

        def name
          elements[4]
        end

        def multi
          elements[6]
        end

        def white
          elements[7]
        end
      end

      module Step1
        def build
          if multi.respond_to?(:build)
            Ast::Step.new(step_keyword.line, step_keyword.text_value, name.text_value.strip, multi.build)
          else
            Ast::Step.new(step_keyword.line, step_keyword.text_value, name.text_value.strip)
          end
        end
      end

      def _nt_step
        start_index = index
        if node_cache[:step].has_key?(index)
          cached = node_cache[:step][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            r3 = _nt_space
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = SyntaxNode.new(input, i2...index, s2)
          s0 << r2
          if r2
            r4 = _nt_step_keyword
            s0 << r4
            if r4
              s5, i5 = [], index
              loop do
                r6 = _nt_space
                if r6
                  s5 << r6
                else
                  break
                end
              end
              r5 = SyntaxNode.new(input, i5...index, s5)
              s0 << r5
              if r5
                r7 = _nt_line_to_eol
                s0 << r7
                if r7
                  i8 = index
                  s9, i9 = [], index
                  loop do
                    r10 = _nt_eol
                    if r10
                      s9 << r10
                    else
                      break
                    end
                  end
                  if s9.empty?
                    self.index = i9
                    r9 = nil
                  else
                    r9 = SyntaxNode.new(input, i9...index, s9)
                  end
                  if r9
                    r8 = r9
                  else
                    r11 = _nt_eof
                    if r11
                      r8 = r11
                    else
                      self.index = i8
                      r8 = nil
                    end
                  end
                  s0 << r8
                  if r8
                    r13 = _nt_multiline_arg
                    if r13
                      r12 = r13
                    else
                      r12 = SyntaxNode.new(input, index...index)
                    end
                    s0 << r12
                    if r12
                      r14 = _nt_white
                      s0 << r14
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Step0)
          r0.extend(Step1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:step][start_index] = r0

        return r0
      end

      module ExamplesSections0
        def build
          elements.map{|e| e.build}
        end
      end

      def _nt_examples_sections
        start_index = index
        if node_cache[:examples_sections].has_key?(index)
          cached = node_cache[:examples_sections][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          r1 = _nt_examples
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)
        r0.extend(ExamplesSections0)

        node_cache[:examples_sections][start_index] = r0

        return r0
      end

      module Examples0
        def examples_keyword
          elements[1]
        end

        def name
          elements[3]
        end

        def eol
          elements[4]
        end

        def table
          elements[5]
        end

        def white
          elements[6]
        end
      end

      module Examples1
        def build
          [examples_keyword.line, examples_keyword.text_value, name.text_value, table.raw]
        end
      end

      def _nt_examples
        start_index = index
        if node_cache[:examples].has_key?(index)
          cached = node_cache[:examples][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        s1, i1 = [], index
        loop do
          r2 = _nt_space
          if r2
            s1 << r2
          else
            break
          end
        end
        r1 = SyntaxNode.new(input, i1...index, s1)
        s0 << r1
        if r1
          r3 = _nt_examples_keyword
          s0 << r3
          if r3
            s4, i4 = [], index
            loop do
              r5 = _nt_space
              if r5
                s4 << r5
              else
                break
              end
            end
            r4 = SyntaxNode.new(input, i4...index, s4)
            s0 << r4
            if r4
              r7 = _nt_line_to_eol
              if r7
                r6 = r7
              else
                r6 = SyntaxNode.new(input, index...index)
              end
              s0 << r6
              if r6
                r8 = _nt_eol
                s0 << r8
                if r8
                  r9 = _nt_table
                  s0 << r9
                  if r9
                    r10 = _nt_white
                    s0 << r10
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(Examples0)
          r0.extend(Examples1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:examples][start_index] = r0

        return r0
      end

      def _nt_multiline_arg
        start_index = index
        if node_cache[:multiline_arg].has_key?(index)
          cached = node_cache[:multiline_arg][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0 = index
        r1 = _nt_table
        if r1
          r0 = r1
        else
          r2 = _nt_py_string
          if r2
            r0 = r2
          else
            self.index = i0
            r0 = nil
          end
        end

        node_cache[:multiline_arg][start_index] = r0

        return r0
      end

      module LineToEol0
      end

      def _nt_line_to_eol
        start_index = index
        if node_cache[:line_to_eol].has_key?(index)
          cached = node_cache[:line_to_eol][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          i2 = index
          r3 = _nt_eol
          if r3
            r2 = nil
          else
            self.index = i2
            r2 = SyntaxNode.new(input, index...index)
          end
          s1 << r2
          if r2
            if index < input_length
              r4 = (SyntaxNode).new(input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r4 = nil
            end
            s1 << r4
          end
          if s1.last
            r1 = (SyntaxNode).new(input, i1...index, s1)
            r1.extend(LineToEol0)
          else
            self.index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)

        node_cache[:line_to_eol][start_index] = r0

        return r0
      end

      module PyString0
      end

      module PyString1
        def open_py_string
          elements[0]
        end

        def s
          elements[1]
        end

        def close_py_string
          elements[2]
        end
      end

      module PyString2
        def build
          Ast::PyString.new(open_py_string.line, close_py_string.line, s.text_value, open_py_string.indentation)
        end
      end

      def _nt_py_string
        start_index = index
        if node_cache[:py_string].has_key?(index)
          cached = node_cache[:py_string][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_open_py_string
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3, s3 = index, []
            i4 = index
            r5 = _nt_close_py_string
            if r5
              r4 = nil
            else
              self.index = i4
              r4 = SyntaxNode.new(input, index...index)
            end
            s3 << r4
            if r4
              if index < input_length
                r6 = (SyntaxNode).new(input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("any character")
                r6 = nil
              end
              s3 << r6
            end
            if s3.last
              r3 = (SyntaxNode).new(input, i3...index, s3)
              r3.extend(PyString0)
            else
              self.index = i3
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = SyntaxNode.new(input, i2...index, s2)
          s0 << r2
          if r2
            r7 = _nt_close_py_string
            s0 << r7
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(PyString1)
          r0.extend(PyString2)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:py_string][start_index] = r0

        return r0
      end

      module OpenPyString0
        def white
          elements[0]
        end

        def eol
          elements[3]
        end
      end

      module OpenPyString1
        def indentation
          white.text_value.length
        end

        def line
          white.line
        end
      end

      def _nt_open_py_string
        start_index = index
        if node_cache[:open_py_string].has_key?(index)
          cached = node_cache[:open_py_string][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_white
        s0 << r1
        if r1
          if input.index('"""', index) == index
            r2 = (SyntaxNode).new(input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('"""')
            r2 = nil
          end
          s0 << r2
          if r2
            s3, i3 = [], index
            loop do
              r4 = _nt_space
              if r4
                s3 << r4
              else
                break
              end
            end
            r3 = SyntaxNode.new(input, i3...index, s3)
            s0 << r3
            if r3
              r5 = _nt_eol
              s0 << r5
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(OpenPyString0)
          r0.extend(OpenPyString1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:open_py_string][start_index] = r0

        return r0
      end

      module ClosePyString0
        def eol
          elements[0]
        end

        def quotes
          elements[2]
        end

        def white
          elements[3]
        end
      end

      module ClosePyString1
        def line
          quotes.line
        end
      end

      def _nt_close_py_string
        start_index = index
        if node_cache[:close_py_string].has_key?(index)
          cached = node_cache[:close_py_string][index]
          @index = cached.interval.end if cached
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_eol
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            r3 = _nt_space
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = SyntaxNode.new(input, i2...index, s2)
          s0 << r2
          if r2
            if input.index('"""', index) == index
              r4 = (SyntaxNode).new(input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure('"""')
              r4 = nil
            end
            s0 << r4
            if r4
              r5 = _nt_white
              s0 << r5
            end
          end
        end
        if s0.last
          r0 = (SyntaxNode).new(input, i0...index, s0)
          r0.extend(ClosePyString0)
          r0.extend(ClosePyString1)
        else
          self.index = i0
          r0 = nil
        end

        node_cache[:close_py_string][start_index] = r0

        return r0
      end

      def _nt_white
        start_index = index
        if node_cache[:white].has_key?(index)
          cached = node_cache[:white][index]
          @index = cached.interval.end if cached
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_space
          if r2
            r1 = r2
          else
            r3 = _nt_eol
            if r3
              r1 = r3
            else
              self.index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = SyntaxNode.new(input, i0...index, s0)

        node_cache[:white][start_index] = r0

        return r0
      end

    end

    class FeatureParser < Treetop::Runtime::CompiledParser
      include Feature
    end

  end
end
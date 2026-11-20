#!/bin/bash

scores=()

while true; do
    echo "------------------------"
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "------------------------"
    read -p "선택 [1-5]: " choice

    case $choice in
        1)
            read -p "추가할 점수를 입력하세요 (0~100): " s
            scores+=($s)
            echo "$s 점이 추가되었습니다."
            ;;
        2)
            echo "입력된 모든 점수: ${scores[*]}"
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                sum=0
                for s in "${scores[@]}"; do
                    sum=$((sum + s))
                .done 2>/dev/null
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
                echo "평균 점수: $avg"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                sum=0
                for s in "${scores[@]}"; do
                    sum=$((sum + s))
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
                if [ $(echo "$avg >= 90" | bc) -eq 1 ]; then
                    echo "평균 등급: A (평균: $avg)"
                else
                    echo "평균 등급: B (평균: $avg)"
                fi
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다. 1에서 5 사이의 숫자를 선택하세요."
            ;;
    esac
done
#!/bin/bash

scores=()

while true; do
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    read -p "선택: " choice

    case $choice in
        1)
            read -p "점수 입력: " s
            scores+=("$s")
            ;;
        2)
            echo "${scores[*]}"
            ;;
        3)
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done
            echo "scale=2; $sum / ${#scores[@]}" | bc
            ;;
        4)
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done
            avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
            if [ "$(echo "$avg >= 90" | bc)" -eq 1 ]; then
                echo "A"
            else
                echo "B"
            fi
            ;;
        5)
            exit 0
            ;;
    esac
done

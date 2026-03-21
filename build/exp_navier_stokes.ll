; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"pi_val"() nounwind {
entry:
  %t9 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.2)
  ret i64 %t9
}

define i64 @"u_init"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t10 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.3)
  %t11 = call i64 @"pi_val"()
  %t12 = call i64 @"sx_f64_mul"(i64 %t10, i64 %t11)
  %t13 = load i64, ptr %local.x
  %t14 = call i64 @"sx_f64_mul"(i64 %t12, i64 %t13)
  %t15 = call i64 @"sin_f64"(i64 %t14)
  ret i64 %t15
}

define i64 @"burgers_step"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.dudx.16 = alloca i64
  %local.d2udx2.17 = alloca i64
  %local.advection.18 = alloca i64
  %local.diffusion.19 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t20 = load i64, ptr %local.u3
  %t21 = load i64, ptr %local.u1
  %t22 = call i64 @"sx_f64_sub"(i64 %t20, i64 %t21)
  %t23 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.4)
  %t24 = load i64, ptr %local.dx
  %t25 = call i64 @"sx_f64_mul"(i64 %t23, i64 %t24)
  %t26 = call i64 @"sx_f64_div"(i64 %t22, i64 %t25)
  store i64 %t26, ptr %local.dudx.16
  %t27 = load i64, ptr %local.u3
  %t28 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.5)
  %t29 = load i64, ptr %local.u2
  %t30 = call i64 @"sx_f64_mul"(i64 %t28, i64 %t29)
  %t31 = call i64 @"sx_f64_sub"(i64 %t27, i64 %t30)
  %t32 = load i64, ptr %local.u1
  %t33 = call i64 @"sx_f64_add"(i64 %t31, i64 %t32)
  %t34 = load i64, ptr %local.dx
  %t35 = load i64, ptr %local.dx
  %t36 = call i64 @"sx_f64_mul"(i64 %t34, i64 %t35)
  %t37 = call i64 @"sx_f64_div"(i64 %t33, i64 %t36)
  store i64 %t37, ptr %local.d2udx2.17
  %t38 = load i64, ptr %local.u2
  %t39 = load i64, ptr %local.dudx.16
  %t40 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t39)
  store i64 %t40, ptr %local.advection.18
  %t41 = load i64, ptr %local.nu
  %t42 = load i64, ptr %local.d2udx2.17
  %t43 = call i64 @"sx_f64_mul"(i64 %t41, i64 %t42)
  store i64 %t43, ptr %local.diffusion.19
  %t44 = load i64, ptr %local.u2
  %t45 = load i64, ptr %local.dt
  %t46 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.6)
  %t47 = load i64, ptr %local.advection.18
  %t48 = call i64 @"sx_f64_sub"(i64 %t46, i64 %t47)
  %t49 = load i64, ptr %local.diffusion.19
  %t50 = call i64 @"sx_f64_add"(i64 %t48, i64 %t49)
  %t51 = call i64 @"sx_f64_mul"(i64 %t45, i64 %t50)
  %t52 = call i64 @"sx_f64_add"(i64 %t44, i64 %t51)
  ret i64 %t52
}

define i64 @"advection_force"(i64 %u1, i64 %u2, i64 %u3, i64 %dx) nounwind {
entry:
  %local.dudx.53 = alloca i64
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t54 = load i64, ptr %local.u3
  %t55 = load i64, ptr %local.u1
  %t56 = call i64 @"sx_f64_sub"(i64 %t54, i64 %t55)
  %t57 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.7)
  %t58 = load i64, ptr %local.dx
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  %t60 = call i64 @"sx_f64_div"(i64 %t56, i64 %t59)
  store i64 %t60, ptr %local.dudx.53
  %t61 = load i64, ptr %local.u2
  %t62 = load i64, ptr %local.dudx.53
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  ret i64 %t63
}

define i64 @"diffusion_force"(i64 %u1, i64 %u2, i64 %u3, i64 %nu, i64 %dx) nounwind {
entry:
  %local.d2udx2.64 = alloca i64
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t65 = load i64, ptr %local.u3
  %t66 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.8)
  %t67 = load i64, ptr %local.u2
  %t68 = call i64 @"sx_f64_mul"(i64 %t66, i64 %t67)
  %t69 = call i64 @"sx_f64_sub"(i64 %t65, i64 %t68)
  %t70 = load i64, ptr %local.u1
  %t71 = call i64 @"sx_f64_add"(i64 %t69, i64 %t70)
  %t72 = load i64, ptr %local.dx
  %t73 = load i64, ptr %local.dx
  %t74 = call i64 @"sx_f64_mul"(i64 %t72, i64 %t73)
  %t75 = call i64 @"sx_f64_div"(i64 %t71, i64 %t74)
  store i64 %t75, ptr %local.d2udx2.64
  %t76 = load i64, ptr %local.nu
  %t77 = load i64, ptr %local.d2udx2.64
  %t78 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t77)
  ret i64 %t78
}

define i64 @"iratio_2force"(i64 %f_adv, i64 %f_diff) nounwind {
entry:
  %local.cross.79 = alloca i64
  %local.ind.80 = alloca i64
  %local.f_adv = alloca i64
  store i64 %f_adv, ptr %local.f_adv
  %local.f_diff = alloca i64
  store i64 %f_diff, ptr %local.f_diff
  %t81 = load i64, ptr %local.f_adv
  %t82 = load i64, ptr %local.f_diff
  %t83 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t82)
  store i64 %t83, ptr %local.cross.79
  %t84 = load i64, ptr %local.f_adv
  %t85 = load i64, ptr %local.f_adv
  %t86 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t85)
  %t87 = load i64, ptr %local.f_diff
  %t88 = load i64, ptr %local.f_diff
  %t89 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t88)
  %t90 = call i64 @"sx_f64_add"(i64 %t86, i64 %t89)
  store i64 %t90, ptr %local.ind.80
  %t91 = load i64, ptr %local.ind.80
  %t92 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.9)
  %t93 = call i64 @"sx_f64_lt"(i64 %t91, i64 %t92)
  %t94 = icmp ne i64 %t93, 0
  br i1 %t94, label %then1, label %else1
then1:
  %t95 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.10)
  ret i64 %t95
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t96 = phi i64 [ 0, %else1_end ]
  %t97 = load i64, ptr %local.cross.79
  %t98 = load i64, ptr %local.ind.80
  %t99 = call i64 @"sx_f64_div"(i64 %t97, i64 %t98)
  ret i64 %t99
}

define i64 @"s_score"(i64 %early_drift, i64 %late_drift) nounwind {
entry:
  %local.early_drift = alloca i64
  store i64 %early_drift, ptr %local.early_drift
  %local.late_drift = alloca i64
  store i64 %late_drift, ptr %local.late_drift
  %t100 = load i64, ptr %local.early_drift
  %t101 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.11)
  %t102 = call i64 @"sx_f64_lt"(i64 %t100, i64 %t101)
  %t103 = icmp ne i64 %t102, 0
  br i1 %t103, label %then2, label %else2
then2:
  %t104 = load i64, ptr %local.late_drift
  %t105 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.12)
  %t106 = call i64 @"sx_f64_lt"(i64 %t104, i64 %t105)
  %t107 = icmp ne i64 %t106, 0
  br i1 %t107, label %then3, label %else3
then3:
  %t108 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.13)
  ret i64 %t108
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t109 = phi i64 [ 0, %else3_end ]
  %t110 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.14)
  %t111 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.15)
  %t112 = call i64 @"sx_f64_sub"(i64 %t110, i64 %t111)
  ret i64 %t112
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t113 = phi i64 [ 0, %else2_end ]
  %t114 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.16)
  %t115 = load i64, ptr %local.late_drift
  %t116 = load i64, ptr %local.early_drift
  %t117 = call i64 @"sx_f64_div"(i64 %t115, i64 %t116)
  %t118 = call i64 @"sx_f64_sub"(i64 %t114, i64 %t117)
  ret i64 %t118
}

define i64 @"run_burgers_sim"(i64 %nu, i64 %out_iratio) nounwind {
entry:
  %local.dx.119 = alloca i64
  %local.dt.120 = alloca i64
  %local.nsteps.121 = alloca i64
  %local.u0.122 = alloca i64
  %local.u1.123 = alloca i64
  %local.u2.124 = alloca i64
  %local.u3.125 = alloca i64
  %local.u4.126 = alloca i64
  %local.step.127 = alloca i64
  %local.prev_u2.128 = alloca i64
  %local.early_drift.129 = alloca i64
  %local.late_drift.130 = alloca i64
  %local.count_e.131 = alloca i64
  %local.count_l.132 = alloca i64
  %local.sum_iratio.133 = alloca i64
  %local.count_ir.134 = alloca i64
  %local.max_u.135 = alloca i64
  %local.new_u0.136 = alloca i64
  %local.new_u1.137 = alloca i64
  %local.new_u2.138 = alloca i64
  %local.new_u3.139 = alloca i64
  %local.new_u4.140 = alloca i64
  %local.drift.141 = alloca i64
  %local.f_adv.142 = alloca i64
  %local.f_diff.143 = alloca i64
  %local.au.144 = alloca i64
  %local.avg_ir.145 = alloca i64
  %local.ss.146 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.out_iratio = alloca i64
  store i64 %out_iratio, ptr %local.out_iratio
  %t147 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.17)
  store i64 %t147, ptr %local.dx.119
  %t148 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.18)
  store i64 %t148, ptr %local.dt.120
  store i64 1000, ptr %local.nsteps.121
  %t149 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.19)
  %t150 = call i64 @"u_init"(i64 %t149)
  store i64 %t150, ptr %local.u0.122
  %t151 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.20)
  %t152 = call i64 @"u_init"(i64 %t151)
  store i64 %t152, ptr %local.u1.123
  %t153 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.21)
  %t154 = call i64 @"u_init"(i64 %t153)
  store i64 %t154, ptr %local.u2.124
  %t155 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.22)
  %t156 = call i64 @"u_init"(i64 %t155)
  store i64 %t156, ptr %local.u3.125
  %t157 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.23)
  %t158 = call i64 @"u_init"(i64 %t157)
  store i64 %t158, ptr %local.u4.126
  store i64 0, ptr %local.step.127
  %t159 = load i64, ptr %local.u2.124
  store i64 %t159, ptr %local.prev_u2.128
  %t160 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.24)
  store i64 %t160, ptr %local.early_drift.129
  %t161 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.25)
  store i64 %t161, ptr %local.late_drift.130
  store i64 0, ptr %local.count_e.131
  store i64 0, ptr %local.count_l.132
  %t162 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.26)
  store i64 %t162, ptr %local.sum_iratio.133
  store i64 0, ptr %local.count_ir.134
  %t163 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.27)
  store i64 %t163, ptr %local.max_u.135
  br label %loop4
loop4:
  %t164 = load i64, ptr %local.step.127
  %t165 = load i64, ptr %local.nsteps.121
  %t166 = icmp slt i64 %t164, %t165
  %t167 = zext i1 %t166 to i64
  %t168 = icmp ne i64 %t167, 0
  br i1 %t168, label %body4, label %endloop4
body4:
  %t169 = load i64, ptr %local.u4.126
  %t170 = load i64, ptr %local.u0.122
  %t171 = load i64, ptr %local.u1.123
  %t172 = load i64, ptr %local.u2.124
  %t173 = load i64, ptr %local.u3.125
  %t174 = load i64, ptr %local.nu
  %t175 = load i64, ptr %local.dt.120
  %t176 = load i64, ptr %local.dx.119
  %t177 = call i64 @"burgers_step"(i64 %t169, i64 %t170, i64 %t171, i64 %t172, i64 %t173, i64 %t174, i64 %t175, i64 %t176)
  store i64 %t177, ptr %local.new_u0.136
  %t178 = load i64, ptr %local.u0.122
  %t179 = load i64, ptr %local.u1.123
  %t180 = load i64, ptr %local.u2.124
  %t181 = load i64, ptr %local.u3.125
  %t182 = load i64, ptr %local.u4.126
  %t183 = load i64, ptr %local.nu
  %t184 = load i64, ptr %local.dt.120
  %t185 = load i64, ptr %local.dx.119
  %t186 = call i64 @"burgers_step"(i64 %t178, i64 %t179, i64 %t180, i64 %t181, i64 %t182, i64 %t183, i64 %t184, i64 %t185)
  store i64 %t186, ptr %local.new_u1.137
  %t187 = load i64, ptr %local.u1.123
  %t188 = load i64, ptr %local.u2.124
  %t189 = load i64, ptr %local.u3.125
  %t190 = load i64, ptr %local.u4.126
  %t191 = load i64, ptr %local.u0.122
  %t192 = load i64, ptr %local.nu
  %t193 = load i64, ptr %local.dt.120
  %t194 = load i64, ptr %local.dx.119
  %t195 = call i64 @"burgers_step"(i64 %t187, i64 %t188, i64 %t189, i64 %t190, i64 %t191, i64 %t192, i64 %t193, i64 %t194)
  store i64 %t195, ptr %local.new_u2.138
  %t196 = load i64, ptr %local.u2.124
  %t197 = load i64, ptr %local.u3.125
  %t198 = load i64, ptr %local.u4.126
  %t199 = load i64, ptr %local.u0.122
  %t200 = load i64, ptr %local.u1.123
  %t201 = load i64, ptr %local.nu
  %t202 = load i64, ptr %local.dt.120
  %t203 = load i64, ptr %local.dx.119
  %t204 = call i64 @"burgers_step"(i64 %t196, i64 %t197, i64 %t198, i64 %t199, i64 %t200, i64 %t201, i64 %t202, i64 %t203)
  store i64 %t204, ptr %local.new_u3.139
  %t205 = load i64, ptr %local.u3.125
  %t206 = load i64, ptr %local.u4.126
  %t207 = load i64, ptr %local.u0.122
  %t208 = load i64, ptr %local.u1.123
  %t209 = load i64, ptr %local.u2.124
  %t210 = load i64, ptr %local.nu
  %t211 = load i64, ptr %local.dt.120
  %t212 = load i64, ptr %local.dx.119
  %t213 = call i64 @"burgers_step"(i64 %t205, i64 %t206, i64 %t207, i64 %t208, i64 %t209, i64 %t210, i64 %t211, i64 %t212)
  store i64 %t213, ptr %local.new_u4.140
  %t214 = load i64, ptr %local.new_u0.136
  store i64 %t214, ptr %local.u0.122
  %t215 = load i64, ptr %local.new_u1.137
  store i64 %t215, ptr %local.u1.123
  %t216 = load i64, ptr %local.new_u2.138
  store i64 %t216, ptr %local.u2.124
  %t217 = load i64, ptr %local.new_u3.139
  store i64 %t217, ptr %local.u3.125
  %t218 = load i64, ptr %local.new_u4.140
  store i64 %t218, ptr %local.u4.126
  %t219 = load i64, ptr %local.u0.122
  %t220 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.28)
  %t221 = call i64 @"sx_f64_gt"(i64 %t219, i64 %t220)
  %t222 = icmp ne i64 %t221, 0
  br i1 %t222, label %then5, label %else5
then5:
  %t223 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.29)
  store i64 %t223, ptr %local.u0.122
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t224 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t225 = load i64, ptr %local.u0.122
  %t226 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.30)
  %t227 = xor i64 %t226, -9223372036854775808
  %t228 = call i64 @"sx_f64_lt"(i64 %t225, i64 %t227)
  %t229 = icmp ne i64 %t228, 0
  br i1 %t229, label %then6, label %else6
then6:
  %t230 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.31)
  %t231 = xor i64 %t230, -9223372036854775808
  store i64 %t231, ptr %local.u0.122
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t232 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t233 = load i64, ptr %local.u1.123
  %t234 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.32)
  %t235 = call i64 @"sx_f64_gt"(i64 %t233, i64 %t234)
  %t236 = icmp ne i64 %t235, 0
  br i1 %t236, label %then7, label %else7
then7:
  %t237 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.33)
  store i64 %t237, ptr %local.u1.123
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t238 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t239 = load i64, ptr %local.u1.123
  %t240 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.34)
  %t241 = xor i64 %t240, -9223372036854775808
  %t242 = call i64 @"sx_f64_lt"(i64 %t239, i64 %t241)
  %t243 = icmp ne i64 %t242, 0
  br i1 %t243, label %then8, label %else8
then8:
  %t244 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.35)
  %t245 = xor i64 %t244, -9223372036854775808
  store i64 %t245, ptr %local.u1.123
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t246 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t247 = load i64, ptr %local.u2.124
  %t248 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.36)
  %t249 = call i64 @"sx_f64_gt"(i64 %t247, i64 %t248)
  %t250 = icmp ne i64 %t249, 0
  br i1 %t250, label %then9, label %else9
then9:
  %t251 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.37)
  store i64 %t251, ptr %local.u2.124
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t252 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t253 = load i64, ptr %local.u2.124
  %t254 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.38)
  %t255 = xor i64 %t254, -9223372036854775808
  %t256 = call i64 @"sx_f64_lt"(i64 %t253, i64 %t255)
  %t257 = icmp ne i64 %t256, 0
  br i1 %t257, label %then10, label %else10
then10:
  %t258 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.39)
  %t259 = xor i64 %t258, -9223372036854775808
  store i64 %t259, ptr %local.u2.124
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t260 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t261 = load i64, ptr %local.u3.125
  %t262 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.40)
  %t263 = call i64 @"sx_f64_gt"(i64 %t261, i64 %t262)
  %t264 = icmp ne i64 %t263, 0
  br i1 %t264, label %then11, label %else11
then11:
  %t265 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.41)
  store i64 %t265, ptr %local.u3.125
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t266 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t267 = load i64, ptr %local.u3.125
  %t268 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.42)
  %t269 = xor i64 %t268, -9223372036854775808
  %t270 = call i64 @"sx_f64_lt"(i64 %t267, i64 %t269)
  %t271 = icmp ne i64 %t270, 0
  br i1 %t271, label %then12, label %else12
then12:
  %t272 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.43)
  %t273 = xor i64 %t272, -9223372036854775808
  store i64 %t273, ptr %local.u3.125
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t274 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t275 = load i64, ptr %local.u4.126
  %t276 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.44)
  %t277 = call i64 @"sx_f64_gt"(i64 %t275, i64 %t276)
  %t278 = icmp ne i64 %t277, 0
  br i1 %t278, label %then13, label %else13
then13:
  %t279 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.45)
  store i64 %t279, ptr %local.u4.126
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t280 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t281 = load i64, ptr %local.u4.126
  %t282 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.46)
  %t283 = xor i64 %t282, -9223372036854775808
  %t284 = call i64 @"sx_f64_lt"(i64 %t281, i64 %t283)
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %then14, label %else14
then14:
  %t286 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.47)
  %t287 = xor i64 %t286, -9223372036854775808
  store i64 %t287, ptr %local.u4.126
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t288 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t289 = load i64, ptr %local.u2.124
  %t290 = load i64, ptr %local.prev_u2.128
  %t291 = call i64 @"sx_f64_sub"(i64 %t289, i64 %t290)
  %t292 = call i64 @"abs_f64"(i64 %t291)
  store i64 %t292, ptr %local.drift.141
  %t293 = load i64, ptr %local.step.127
  %t294 = icmp sge i64 %t293, 100
  %t295 = zext i1 %t294 to i64
  %t296 = icmp ne i64 %t295, 0
  br i1 %t296, label %then15, label %else15
then15:
  %t297 = load i64, ptr %local.step.127
  %t298 = icmp slt i64 %t297, 400
  %t299 = zext i1 %t298 to i64
  %t300 = icmp ne i64 %t299, 0
  br i1 %t300, label %then16, label %else16
then16:
  %t301 = load i64, ptr %local.early_drift.129
  %t302 = load i64, ptr %local.drift.141
  %t303 = call i64 @"sx_f64_add"(i64 %t301, i64 %t302)
  store i64 %t303, ptr %local.early_drift.129
  %t304 = load i64, ptr %local.count_e.131
  %t305 = add i64 %t304, 1
  store i64 %t305, ptr %local.count_e.131
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t306 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t307 = phi i64 [ %t306, %then15_end ], [ 0, %else15_end ]
  %t308 = load i64, ptr %local.step.127
  %t309 = icmp sge i64 %t308, 700
  %t310 = zext i1 %t309 to i64
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %then17, label %else17
then17:
  %t312 = load i64, ptr %local.late_drift.130
  %t313 = load i64, ptr %local.drift.141
  %t314 = call i64 @"sx_f64_add"(i64 %t312, i64 %t313)
  store i64 %t314, ptr %local.late_drift.130
  %t315 = load i64, ptr %local.count_l.132
  %t316 = add i64 %t315, 1
  store i64 %t316, ptr %local.count_l.132
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t317 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t318 = load i64, ptr %local.step.127
  %t319 = icmp sge i64 %t318, 500
  %t320 = zext i1 %t319 to i64
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then18, label %else18
then18:
  %t322 = load i64, ptr %local.u1.123
  %t323 = load i64, ptr %local.u2.124
  %t324 = load i64, ptr %local.u3.125
  %t325 = load i64, ptr %local.dx.119
  %t326 = call i64 @"advection_force"(i64 %t322, i64 %t323, i64 %t324, i64 %t325)
  store i64 %t326, ptr %local.f_adv.142
  %t327 = load i64, ptr %local.u1.123
  %t328 = load i64, ptr %local.u2.124
  %t329 = load i64, ptr %local.u3.125
  %t330 = load i64, ptr %local.nu
  %t331 = load i64, ptr %local.dx.119
  %t332 = call i64 @"diffusion_force"(i64 %t327, i64 %t328, i64 %t329, i64 %t330, i64 %t331)
  store i64 %t332, ptr %local.f_diff.143
  %t333 = load i64, ptr %local.sum_iratio.133
  %t334 = load i64, ptr %local.f_adv.142
  %t335 = load i64, ptr %local.f_diff.143
  %t336 = call i64 @"iratio_2force"(i64 %t334, i64 %t335)
  %t337 = call i64 @"sx_f64_add"(i64 %t333, i64 %t336)
  store i64 %t337, ptr %local.sum_iratio.133
  %t338 = load i64, ptr %local.count_ir.134
  %t339 = add i64 %t338, 1
  store i64 %t339, ptr %local.count_ir.134
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t340 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t341 = load i64, ptr %local.u2.124
  %t342 = call i64 @"abs_f64"(i64 %t341)
  store i64 %t342, ptr %local.au.144
  %t343 = load i64, ptr %local.au.144
  %t344 = load i64, ptr %local.max_u.135
  %t345 = call i64 @"sx_f64_gt"(i64 %t343, i64 %t344)
  %t346 = icmp ne i64 %t345, 0
  br i1 %t346, label %then19, label %else19
then19:
  %t347 = load i64, ptr %local.au.144
  store i64 %t347, ptr %local.max_u.135
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t348 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t349 = load i64, ptr %local.u2.124
  store i64 %t349, ptr %local.prev_u2.128
  %t350 = load i64, ptr %local.step.127
  %t351 = add i64 %t350, 1
  store i64 %t351, ptr %local.step.127
  br label %loop4
endloop4:
  %t352 = load i64, ptr %local.count_e.131
  %t353 = icmp sgt i64 %t352, 0
  %t354 = zext i1 %t353 to i64
  %t355 = icmp ne i64 %t354, 0
  br i1 %t355, label %then20, label %else20
then20:
  %t356 = load i64, ptr %local.early_drift.129
  %t357 = load i64, ptr %local.count_e.131
  %t358 = call i64 @"sx_int_to_f64"(i64 %t357)
  %t359 = call i64 @"sx_f64_div"(i64 %t356, i64 %t358)
  store i64 %t359, ptr %local.early_drift.129
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t360 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t361 = load i64, ptr %local.count_l.132
  %t362 = icmp sgt i64 %t361, 0
  %t363 = zext i1 %t362 to i64
  %t364 = icmp ne i64 %t363, 0
  br i1 %t364, label %then21, label %else21
then21:
  %t365 = load i64, ptr %local.late_drift.130
  %t366 = load i64, ptr %local.count_l.132
  %t367 = call i64 @"sx_int_to_f64"(i64 %t366)
  %t368 = call i64 @"sx_f64_div"(i64 %t365, i64 %t367)
  store i64 %t368, ptr %local.late_drift.130
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t369 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t370 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.48)
  store i64 %t370, ptr %local.avg_ir.145
  %t371 = load i64, ptr %local.count_ir.134
  %t372 = icmp sgt i64 %t371, 0
  %t373 = zext i1 %t372 to i64
  %t374 = icmp ne i64 %t373, 0
  br i1 %t374, label %then22, label %else22
then22:
  %t375 = load i64, ptr %local.sum_iratio.133
  %t376 = load i64, ptr %local.count_ir.134
  %t377 = call i64 @"sx_int_to_f64"(i64 %t376)
  %t378 = call i64 @"sx_f64_div"(i64 %t375, i64 %t377)
  store i64 %t378, ptr %local.avg_ir.145
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t379 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t380 = load i64, ptr %local.early_drift.129
  %t381 = load i64, ptr %local.late_drift.130
  %t382 = call i64 @"s_score"(i64 %t380, i64 %t381)
  store i64 %t382, ptr %local.ss.146
  %t383 = load i64, ptr %local.out_iratio
  %t384 = icmp eq i64 %t383, 0
  %t385 = zext i1 %t384 to i64
  %t386 = icmp ne i64 %t385, 0
  br i1 %t386, label %then23, label %else23
then23:
  %t387 = load i64, ptr %local.avg_ir.145
  ret i64 %t387
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t388 = phi i64 [ 0, %else23_end ]
  %t389 = load i64, ptr %local.out_iratio
  %t390 = icmp eq i64 %t389, 1
  %t391 = zext i1 %t390 to i64
  %t392 = icmp ne i64 %t391, 0
  br i1 %t392, label %then24, label %else24
then24:
  %t393 = load i64, ptr %local.ss.146
  ret i64 %t393
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t394 = phi i64 [ 0, %else24_end ]
  %t395 = load i64, ptr %local.max_u.135
  ret i64 %t395
}

define i64 @"test_viscosity_sweep"() nounwind {
entry:
  %local.sweep.396 = alloca i64
  %local.nu.397 = alloca i64
  %local.ir.398 = alloca i64
  %local.ss.399 = alloca i64
  %local.mu.400 = alloca i64
  %t401 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.49)
  %t402 = ptrtoint ptr %t401 to i64
  %t403 = inttoptr i64 %t402 to ptr
  call void @intrinsic_println(ptr %t403)
  %t404 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.50)
  %t405 = ptrtoint ptr %t404 to i64
  %t406 = inttoptr i64 %t405 to ptr
  call void @intrinsic_println(ptr %t406)
  %t407 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.51)
  %t408 = ptrtoint ptr %t407 to i64
  %t409 = inttoptr i64 %t408 to ptr
  call void @intrinsic_println(ptr %t409)
  %t410 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.52)
  %t411 = ptrtoint ptr %t410 to i64
  %t412 = inttoptr i64 %t411 to ptr
  call void @intrinsic_println(ptr %t412)
  %t413 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.53)
  %t414 = ptrtoint ptr %t413 to i64
  %t415 = inttoptr i64 %t414 to ptr
  call void @intrinsic_println(ptr %t415)
  %t416 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.54)
  %t417 = ptrtoint ptr %t416 to i64
  %t418 = inttoptr i64 %t417 to ptr
  call void @intrinsic_println(ptr %t418)
  %t419 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.55)
  %t420 = ptrtoint ptr %t419 to i64
  %t421 = inttoptr i64 %t420 to ptr
  call void @intrinsic_println(ptr %t421)
  store i64 0, ptr %local.sweep.396
  br label %loop25
loop25:
  %t422 = load i64, ptr %local.sweep.396
  %t423 = icmp slt i64 %t422, 8
  %t424 = zext i1 %t423 to i64
  %t425 = icmp ne i64 %t424, 0
  br i1 %t425, label %body25, label %endloop25
body25:
  %t426 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.56)
  store i64 %t426, ptr %local.nu.397
  %t427 = load i64, ptr %local.sweep.396
  %t428 = icmp eq i64 %t427, 0
  %t429 = zext i1 %t428 to i64
  %t430 = icmp ne i64 %t429, 0
  br i1 %t430, label %then26, label %else26
then26:
  %t431 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.57)
  store i64 %t431, ptr %local.nu.397
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t432 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t433 = load i64, ptr %local.sweep.396
  %t434 = icmp eq i64 %t433, 1
  %t435 = zext i1 %t434 to i64
  %t436 = icmp ne i64 %t435, 0
  br i1 %t436, label %then27, label %else27
then27:
  %t437 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.58)
  store i64 %t437, ptr %local.nu.397
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t438 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t439 = load i64, ptr %local.sweep.396
  %t440 = icmp eq i64 %t439, 2
  %t441 = zext i1 %t440 to i64
  %t442 = icmp ne i64 %t441, 0
  br i1 %t442, label %then28, label %else28
then28:
  %t443 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.59)
  store i64 %t443, ptr %local.nu.397
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t444 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t445 = load i64, ptr %local.sweep.396
  %t446 = icmp eq i64 %t445, 3
  %t447 = zext i1 %t446 to i64
  %t448 = icmp ne i64 %t447, 0
  br i1 %t448, label %then29, label %else29
then29:
  %t449 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.60)
  store i64 %t449, ptr %local.nu.397
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t450 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t451 = load i64, ptr %local.sweep.396
  %t452 = icmp eq i64 %t451, 4
  %t453 = zext i1 %t452 to i64
  %t454 = icmp ne i64 %t453, 0
  br i1 %t454, label %then30, label %else30
then30:
  %t455 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.61)
  store i64 %t455, ptr %local.nu.397
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t456 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t457 = load i64, ptr %local.sweep.396
  %t458 = icmp eq i64 %t457, 5
  %t459 = zext i1 %t458 to i64
  %t460 = icmp ne i64 %t459, 0
  br i1 %t460, label %then31, label %else31
then31:
  %t461 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.62)
  store i64 %t461, ptr %local.nu.397
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t462 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t463 = load i64, ptr %local.sweep.396
  %t464 = icmp eq i64 %t463, 6
  %t465 = zext i1 %t464 to i64
  %t466 = icmp ne i64 %t465, 0
  br i1 %t466, label %then32, label %else32
then32:
  %t467 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.63)
  store i64 %t467, ptr %local.nu.397
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t468 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t469 = load i64, ptr %local.sweep.396
  %t470 = icmp eq i64 %t469, 7
  %t471 = zext i1 %t470 to i64
  %t472 = icmp ne i64 %t471, 0
  br i1 %t472, label %then33, label %else33
then33:
  %t473 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.64)
  store i64 %t473, ptr %local.nu.397
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t474 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t475 = load i64, ptr %local.nu.397
  %t476 = call i64 @"run_burgers_sim"(i64 %t475, i64 0)
  store i64 %t476, ptr %local.ir.398
  %t477 = load i64, ptr %local.nu.397
  %t478 = call i64 @"run_burgers_sim"(i64 %t477, i64 1)
  store i64 %t478, ptr %local.ss.399
  %t479 = load i64, ptr %local.nu.397
  %t480 = call i64 @"run_burgers_sim"(i64 %t479, i64 2)
  store i64 %t480, ptr %local.mu.400
  %t481 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.65)
  %t482 = ptrtoint ptr %t481 to i64
  %t483 = inttoptr i64 %t482 to ptr
  call void @intrinsic_print(ptr %t483)
  %t484 = load i64, ptr %local.nu.397
  %t485 = call i64 @"print_f64"(i64 %t484)
  %t486 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.66)
  %t487 = ptrtoint ptr %t486 to i64
  %t488 = inttoptr i64 %t487 to ptr
  call void @intrinsic_print(ptr %t488)
  %t489 = load i64, ptr %local.ir.398
  %t490 = call i64 @"print_f64"(i64 %t489)
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.67)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_print(ptr %t493)
  %t494 = load i64, ptr %local.ss.399
  %t495 = call i64 @"print_f64"(i64 %t494)
  %t496 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.68)
  %t497 = ptrtoint ptr %t496 to i64
  %t498 = inttoptr i64 %t497 to ptr
  call void @intrinsic_print(ptr %t498)
  %t499 = load i64, ptr %local.mu.400
  %t500 = call i64 @"print_f64"(i64 %t499)
  %t501 = load i64, ptr %local.ir.398
  %t502 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.69)
  %t503 = call i64 @"sx_f64_add"(i64 %t501, i64 %t502)
  %t504 = call i64 @"abs_f64"(i64 %t503)
  %t505 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.70)
  %t506 = call i64 @"sx_f64_lt"(i64 %t504, i64 %t505)
  %t507 = icmp ne i64 %t506, 0
  br i1 %t507, label %then34, label %else34
then34:
  %t508 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.71)
  %t509 = ptrtoint ptr %t508 to i64
  %t510 = inttoptr i64 %t509 to ptr
  call void @intrinsic_println(ptr %t510)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  %t511 = load i64, ptr %local.ss.399
  %t512 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.72)
  %t513 = call i64 @"sx_f64_lt"(i64 %t511, i64 %t512)
  %t514 = icmp ne i64 %t513, 0
  br i1 %t514, label %then35, label %else35
then35:
  %t515 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.73)
  %t516 = ptrtoint ptr %t515 to i64
  %t517 = inttoptr i64 %t516 to ptr
  call void @intrinsic_println(ptr %t517)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t518 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.74)
  %t519 = ptrtoint ptr %t518 to i64
  %t520 = inttoptr i64 %t519 to ptr
  call void @intrinsic_println(ptr %t520)
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t521 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t522 = phi i64 [ 0, %then34_end ], [ %t521, %else34_end ]
  %t523 = load i64, ptr %local.sweep.396
  %t524 = add i64 %t523, 1
  store i64 %t524, ptr %local.sweep.396
  br label %loop25
endloop25:
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.75)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  %t528 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.76)
  %t529 = ptrtoint ptr %t528 to i64
  %t530 = inttoptr i64 %t529 to ptr
  call void @intrinsic_println(ptr %t530)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.77)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_println(ptr %t533)
  %t534 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.78)
  %t535 = ptrtoint ptr %t534 to i64
  %t536 = inttoptr i64 %t535 to ptr
  call void @intrinsic_println(ptr %t536)
  ret i64 0
}

define i64 @"test_reynolds"() nounwind {
entry:
  %local.sweep.537 = alloca i64
  %local.nu.538 = alloca i64
  %local.re.539 = alloca i64
  %local.ir.540 = alloca i64
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.79)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_println(ptr %t543)
  %t544 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.80)
  %t545 = ptrtoint ptr %t544 to i64
  %t546 = inttoptr i64 %t545 to ptr
  call void @intrinsic_println(ptr %t546)
  %t547 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.81)
  %t548 = ptrtoint ptr %t547 to i64
  %t549 = inttoptr i64 %t548 to ptr
  call void @intrinsic_println(ptr %t549)
  %t550 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.82)
  %t551 = ptrtoint ptr %t550 to i64
  %t552 = inttoptr i64 %t551 to ptr
  call void @intrinsic_println(ptr %t552)
  %t553 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.83)
  %t554 = ptrtoint ptr %t553 to i64
  %t555 = inttoptr i64 %t554 to ptr
  call void @intrinsic_println(ptr %t555)
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.84)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  store i64 0, ptr %local.sweep.537
  br label %loop36
loop36:
  %t559 = load i64, ptr %local.sweep.537
  %t560 = icmp slt i64 %t559, 10
  %t561 = zext i1 %t560 to i64
  %t562 = icmp ne i64 %t561, 0
  br i1 %t562, label %body36, label %endloop36
body36:
  %t563 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.85)
  store i64 %t563, ptr %local.nu.538
  %t564 = load i64, ptr %local.sweep.537
  %t565 = icmp eq i64 %t564, 0
  %t566 = zext i1 %t565 to i64
  %t567 = icmp ne i64 %t566, 0
  br i1 %t567, label %then37, label %else37
then37:
  %t568 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.86)
  store i64 %t568, ptr %local.nu.538
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t569 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t570 = load i64, ptr %local.sweep.537
  %t571 = icmp eq i64 %t570, 1
  %t572 = zext i1 %t571 to i64
  %t573 = icmp ne i64 %t572, 0
  br i1 %t573, label %then38, label %else38
then38:
  %t574 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.87)
  store i64 %t574, ptr %local.nu.538
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t575 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t576 = load i64, ptr %local.sweep.537
  %t577 = icmp eq i64 %t576, 2
  %t578 = zext i1 %t577 to i64
  %t579 = icmp ne i64 %t578, 0
  br i1 %t579, label %then39, label %else39
then39:
  %t580 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.88)
  store i64 %t580, ptr %local.nu.538
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t581 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t582 = load i64, ptr %local.sweep.537
  %t583 = icmp eq i64 %t582, 3
  %t584 = zext i1 %t583 to i64
  %t585 = icmp ne i64 %t584, 0
  br i1 %t585, label %then40, label %else40
then40:
  %t586 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.89)
  store i64 %t586, ptr %local.nu.538
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t587 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t588 = load i64, ptr %local.sweep.537
  %t589 = icmp eq i64 %t588, 4
  %t590 = zext i1 %t589 to i64
  %t591 = icmp ne i64 %t590, 0
  br i1 %t591, label %then41, label %else41
then41:
  %t592 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.90)
  store i64 %t592, ptr %local.nu.538
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t593 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t594 = load i64, ptr %local.sweep.537
  %t595 = icmp eq i64 %t594, 5
  %t596 = zext i1 %t595 to i64
  %t597 = icmp ne i64 %t596, 0
  br i1 %t597, label %then42, label %else42
then42:
  %t598 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.91)
  store i64 %t598, ptr %local.nu.538
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t599 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t600 = load i64, ptr %local.sweep.537
  %t601 = icmp eq i64 %t600, 6
  %t602 = zext i1 %t601 to i64
  %t603 = icmp ne i64 %t602, 0
  br i1 %t603, label %then43, label %else43
then43:
  %t604 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.92)
  store i64 %t604, ptr %local.nu.538
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t605 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t606 = load i64, ptr %local.sweep.537
  %t607 = icmp eq i64 %t606, 7
  %t608 = zext i1 %t607 to i64
  %t609 = icmp ne i64 %t608, 0
  br i1 %t609, label %then44, label %else44
then44:
  %t610 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.93)
  store i64 %t610, ptr %local.nu.538
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t611 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t612 = load i64, ptr %local.sweep.537
  %t613 = icmp eq i64 %t612, 8
  %t614 = zext i1 %t613 to i64
  %t615 = icmp ne i64 %t614, 0
  br i1 %t615, label %then45, label %else45
then45:
  %t616 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.94)
  store i64 %t616, ptr %local.nu.538
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t617 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t618 = load i64, ptr %local.sweep.537
  %t619 = icmp eq i64 %t618, 9
  %t620 = zext i1 %t619 to i64
  %t621 = icmp ne i64 %t620, 0
  br i1 %t621, label %then46, label %else46
then46:
  %t622 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.95)
  store i64 %t622, ptr %local.nu.538
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t623 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t624 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.96)
  %t625 = load i64, ptr %local.nu.538
  %t626 = call i64 @"sx_f64_div"(i64 %t624, i64 %t625)
  store i64 %t626, ptr %local.re.539
  %t627 = load i64, ptr %local.nu.538
  %t628 = call i64 @"run_burgers_sim"(i64 %t627, i64 0)
  store i64 %t628, ptr %local.ir.540
  %t629 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.97)
  %t630 = ptrtoint ptr %t629 to i64
  %t631 = inttoptr i64 %t630 to ptr
  call void @intrinsic_print(ptr %t631)
  %t632 = load i64, ptr %local.re.539
  %t633 = call i64 @"print_f64"(i64 %t632)
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.98)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_print(ptr %t636)
  %t637 = load i64, ptr %local.nu.538
  %t638 = call i64 @"print_f64"(i64 %t637)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.99)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_print(ptr %t641)
  %t642 = load i64, ptr %local.ir.540
  %t643 = call i64 @"print_f64"(i64 %t642)
  %t644 = load i64, ptr %local.ir.540
  %t645 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.100)
  %t646 = call i64 @"sx_f64_add"(i64 %t644, i64 %t645)
  %t647 = call i64 @"abs_f64"(i64 %t646)
  %t648 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.101)
  %t649 = call i64 @"sx_f64_lt"(i64 %t647, i64 %t648)
  %t650 = icmp ne i64 %t649, 0
  br i1 %t650, label %then47, label %else47
then47:
  %t651 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.102)
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = inttoptr i64 %t652 to ptr
  call void @intrinsic_println(ptr %t653)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  %t654 = load i64, ptr %local.ir.540
  %t655 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.103)
  %t656 = call i64 @"sx_f64_add"(i64 %t654, i64 %t655)
  %t657 = call i64 @"abs_f64"(i64 %t656)
  %t658 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.104)
  %t659 = call i64 @"sx_f64_lt"(i64 %t657, i64 %t658)
  %t660 = icmp ne i64 %t659, 0
  br i1 %t660, label %then48, label %else48
then48:
  %t661 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.105)
  %t662 = ptrtoint ptr %t661 to i64
  %t663 = inttoptr i64 %t662 to ptr
  call void @intrinsic_println(ptr %t663)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t664 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.106)
  %t665 = ptrtoint ptr %t664 to i64
  %t666 = inttoptr i64 %t665 to ptr
  call void @intrinsic_println(ptr %t666)
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t667 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t668 = phi i64 [ 0, %then47_end ], [ %t667, %else47_end ]
  %t669 = load i64, ptr %local.sweep.537
  %t670 = add i64 %t669, 1
  store i64 %t670, ptr %local.sweep.537
  br label %loop36
endloop36:
  %t671 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.107)
  %t672 = ptrtoint ptr %t671 to i64
  %t673 = inttoptr i64 %t672 to ptr
  call void @intrinsic_println(ptr %t673)
  %t674 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.108)
  %t675 = ptrtoint ptr %t674 to i64
  %t676 = inttoptr i64 %t675 to ptr
  call void @intrinsic_println(ptr %t676)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.109)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_println(ptr %t679)
  %t680 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.110)
  %t681 = ptrtoint ptr %t680 to i64
  %t682 = inttoptr i64 %t681 to ptr
  call void @intrinsic_println(ptr %t682)
  %t683 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.111)
  %t684 = ptrtoint ptr %t683 to i64
  %t685 = inttoptr i64 %t684 to ptr
  call void @intrinsic_println(ptr %t685)
  ret i64 0
}

define i64 @"test_blowup_detection"() nounwind {
entry:
  %local.nu.686 = alloca i64
  %local.dx.687 = alloca i64
  %local.dt.688 = alloca i64
  %local.u0.689 = alloca i64
  %local.u1.690 = alloca i64
  %local.u2.691 = alloca i64
  %local.u3.692 = alloca i64
  %local.u4.693 = alloca i64
  %local.step.694 = alloca i64
  %local.prev_u2.695 = alloca i64
  %local.window_sum.696 = alloca i64
  %local.window_count.697 = alloca i64
  %local.prev_window_avg.698 = alloca i64
  %local.max_u.699 = alloca i64
  %local.blowup_step.700 = alloca i64
  %local.s_neg_step.701 = alloca i64
  %local.new_u0.702 = alloca i64
  %local.new_u1.703 = alloca i64
  %local.new_u2.704 = alloca i64
  %local.new_u3.705 = alloca i64
  %local.new_u4.706 = alloca i64
  %local.drift.707 = alloca i64
  %local.au2.708 = alloca i64
  %local.window_avg.709 = alloca i64
  %local.s_local.710 = alloca i64
  %t711 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.112)
  %t712 = ptrtoint ptr %t711 to i64
  %t713 = inttoptr i64 %t712 to ptr
  call void @intrinsic_println(ptr %t713)
  %t714 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.113)
  %t715 = ptrtoint ptr %t714 to i64
  %t716 = inttoptr i64 %t715 to ptr
  call void @intrinsic_println(ptr %t716)
  %t717 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.114)
  %t718 = ptrtoint ptr %t717 to i64
  %t719 = inttoptr i64 %t718 to ptr
  call void @intrinsic_println(ptr %t719)
  %t720 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.115)
  %t721 = ptrtoint ptr %t720 to i64
  %t722 = inttoptr i64 %t721 to ptr
  call void @intrinsic_println(ptr %t722)
  %t723 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.116)
  store i64 %t723, ptr %local.nu.686
  %t724 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.117)
  store i64 %t724, ptr %local.dx.687
  %t725 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.118)
  store i64 %t725, ptr %local.dt.688
  %t726 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.119)
  %t727 = call i64 @"u_init"(i64 %t726)
  store i64 %t727, ptr %local.u0.689
  %t728 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.120)
  %t729 = call i64 @"u_init"(i64 %t728)
  store i64 %t729, ptr %local.u1.690
  %t730 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.121)
  %t731 = call i64 @"u_init"(i64 %t730)
  store i64 %t731, ptr %local.u2.691
  %t732 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.122)
  %t733 = call i64 @"u_init"(i64 %t732)
  store i64 %t733, ptr %local.u3.692
  %t734 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.123)
  %t735 = call i64 @"u_init"(i64 %t734)
  store i64 %t735, ptr %local.u4.693
  store i64 0, ptr %local.step.694
  %t736 = load i64, ptr %local.u2.691
  store i64 %t736, ptr %local.prev_u2.695
  %t737 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.124)
  store i64 %t737, ptr %local.window_sum.696
  store i64 0, ptr %local.window_count.697
  %t738 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.125)
  store i64 %t738, ptr %local.prev_window_avg.698
  %t739 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.126)
  store i64 %t739, ptr %local.max_u.699
  %t740 = sub i64 0, 1
  store i64 %t740, ptr %local.blowup_step.700
  %t741 = sub i64 0, 1
  store i64 %t741, ptr %local.s_neg_step.701
  %t742 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.127)
  %t743 = ptrtoint ptr %t742 to i64
  %t744 = inttoptr i64 %t743 to ptr
  call void @intrinsic_println(ptr %t744)
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.128)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  br label %loop49
loop49:
  %t748 = load i64, ptr %local.step.694
  %t749 = icmp slt i64 %t748, 2000
  %t750 = zext i1 %t749 to i64
  %t751 = icmp ne i64 %t750, 0
  br i1 %t751, label %body49, label %endloop49
body49:
  %t752 = load i64, ptr %local.u4.693
  %t753 = load i64, ptr %local.u0.689
  %t754 = load i64, ptr %local.u1.690
  %t755 = load i64, ptr %local.u2.691
  %t756 = load i64, ptr %local.u3.692
  %t757 = load i64, ptr %local.nu.686
  %t758 = load i64, ptr %local.dt.688
  %t759 = load i64, ptr %local.dx.687
  %t760 = call i64 @"burgers_step"(i64 %t752, i64 %t753, i64 %t754, i64 %t755, i64 %t756, i64 %t757, i64 %t758, i64 %t759)
  store i64 %t760, ptr %local.new_u0.702
  %t761 = load i64, ptr %local.u0.689
  %t762 = load i64, ptr %local.u1.690
  %t763 = load i64, ptr %local.u2.691
  %t764 = load i64, ptr %local.u3.692
  %t765 = load i64, ptr %local.u4.693
  %t766 = load i64, ptr %local.nu.686
  %t767 = load i64, ptr %local.dt.688
  %t768 = load i64, ptr %local.dx.687
  %t769 = call i64 @"burgers_step"(i64 %t761, i64 %t762, i64 %t763, i64 %t764, i64 %t765, i64 %t766, i64 %t767, i64 %t768)
  store i64 %t769, ptr %local.new_u1.703
  %t770 = load i64, ptr %local.u1.690
  %t771 = load i64, ptr %local.u2.691
  %t772 = load i64, ptr %local.u3.692
  %t773 = load i64, ptr %local.u4.693
  %t774 = load i64, ptr %local.u0.689
  %t775 = load i64, ptr %local.nu.686
  %t776 = load i64, ptr %local.dt.688
  %t777 = load i64, ptr %local.dx.687
  %t778 = call i64 @"burgers_step"(i64 %t770, i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777)
  store i64 %t778, ptr %local.new_u2.704
  %t779 = load i64, ptr %local.u2.691
  %t780 = load i64, ptr %local.u3.692
  %t781 = load i64, ptr %local.u4.693
  %t782 = load i64, ptr %local.u0.689
  %t783 = load i64, ptr %local.u1.690
  %t784 = load i64, ptr %local.nu.686
  %t785 = load i64, ptr %local.dt.688
  %t786 = load i64, ptr %local.dx.687
  %t787 = call i64 @"burgers_step"(i64 %t779, i64 %t780, i64 %t781, i64 %t782, i64 %t783, i64 %t784, i64 %t785, i64 %t786)
  store i64 %t787, ptr %local.new_u3.705
  %t788 = load i64, ptr %local.u3.692
  %t789 = load i64, ptr %local.u4.693
  %t790 = load i64, ptr %local.u0.689
  %t791 = load i64, ptr %local.u1.690
  %t792 = load i64, ptr %local.u2.691
  %t793 = load i64, ptr %local.nu.686
  %t794 = load i64, ptr %local.dt.688
  %t795 = load i64, ptr %local.dx.687
  %t796 = call i64 @"burgers_step"(i64 %t788, i64 %t789, i64 %t790, i64 %t791, i64 %t792, i64 %t793, i64 %t794, i64 %t795)
  store i64 %t796, ptr %local.new_u4.706
  %t797 = load i64, ptr %local.new_u0.702
  store i64 %t797, ptr %local.u0.689
  %t798 = load i64, ptr %local.new_u1.703
  store i64 %t798, ptr %local.u1.690
  %t799 = load i64, ptr %local.new_u2.704
  store i64 %t799, ptr %local.u2.691
  %t800 = load i64, ptr %local.new_u3.705
  store i64 %t800, ptr %local.u3.692
  %t801 = load i64, ptr %local.new_u4.706
  store i64 %t801, ptr %local.u4.693
  %t802 = load i64, ptr %local.u2.691
  %t803 = load i64, ptr %local.prev_u2.695
  %t804 = call i64 @"sx_f64_sub"(i64 %t802, i64 %t803)
  %t805 = call i64 @"abs_f64"(i64 %t804)
  store i64 %t805, ptr %local.drift.707
  %t806 = load i64, ptr %local.window_sum.696
  %t807 = load i64, ptr %local.drift.707
  %t808 = call i64 @"sx_f64_add"(i64 %t806, i64 %t807)
  store i64 %t808, ptr %local.window_sum.696
  %t809 = load i64, ptr %local.window_count.697
  %t810 = add i64 %t809, 1
  store i64 %t810, ptr %local.window_count.697
  %t811 = load i64, ptr %local.u2.691
  %t812 = call i64 @"abs_f64"(i64 %t811)
  store i64 %t812, ptr %local.au2.708
  %t813 = load i64, ptr %local.au2.708
  %t814 = load i64, ptr %local.max_u.699
  %t815 = call i64 @"sx_f64_gt"(i64 %t813, i64 %t814)
  %t816 = icmp ne i64 %t815, 0
  br i1 %t816, label %then50, label %else50
then50:
  %t817 = load i64, ptr %local.au2.708
  store i64 %t817, ptr %local.max_u.699
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t818 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t819 = load i64, ptr %local.au2.708
  %t820 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.129)
  %t821 = call i64 @"sx_f64_gt"(i64 %t819, i64 %t820)
  %t822 = icmp ne i64 %t821, 0
  br i1 %t822, label %then51, label %else51
then51:
  %t823 = load i64, ptr %local.blowup_step.700
  %t824 = sub i64 0, 1
  %t825 = icmp eq i64 %t823, %t824
  %t826 = zext i1 %t825 to i64
  %t827 = icmp ne i64 %t826, 0
  br i1 %t827, label %then52, label %else52
then52:
  %t828 = load i64, ptr %local.step.694
  store i64 %t828, ptr %local.blowup_step.700
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t829 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t830 = phi i64 [ %t829, %then51_end ], [ 0, %else51_end ]
  %t831 = load i64, ptr %local.window_count.697
  %t832 = icmp sge i64 %t831, 100
  %t833 = zext i1 %t832 to i64
  %t834 = icmp ne i64 %t833, 0
  br i1 %t834, label %then53, label %else53
then53:
  %t835 = load i64, ptr %local.window_sum.696
  %t836 = load i64, ptr %local.window_count.697
  %t837 = call i64 @"sx_int_to_f64"(i64 %t836)
  %t838 = call i64 @"sx_f64_div"(i64 %t835, i64 %t837)
  store i64 %t838, ptr %local.window_avg.709
  %t839 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.130)
  store i64 %t839, ptr %local.s_local.710
  %t840 = load i64, ptr %local.prev_window_avg.698
  %t841 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.131)
  %t842 = call i64 @"sx_f64_gt"(i64 %t840, i64 %t841)
  %t843 = icmp ne i64 %t842, 0
  br i1 %t843, label %then54, label %else54
then54:
  %t844 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.132)
  %t845 = load i64, ptr %local.window_avg.709
  %t846 = load i64, ptr %local.prev_window_avg.698
  %t847 = call i64 @"sx_f64_div"(i64 %t845, i64 %t846)
  %t848 = call i64 @"sx_f64_sub"(i64 %t844, i64 %t847)
  store i64 %t848, ptr %local.s_local.710
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t849 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t850 = load i64, ptr %local.s_local.710
  %t851 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.133)
  %t852 = call i64 @"sx_f64_lt"(i64 %t850, i64 %t851)
  %t853 = icmp ne i64 %t852, 0
  br i1 %t853, label %then55, label %else55
then55:
  %t854 = load i64, ptr %local.s_neg_step.701
  %t855 = sub i64 0, 1
  %t856 = icmp eq i64 %t854, %t855
  %t857 = zext i1 %t856 to i64
  %t858 = icmp ne i64 %t857, 0
  br i1 %t858, label %then56, label %else56
then56:
  %t859 = load i64, ptr %local.step.694
  store i64 %t859, ptr %local.s_neg_step.701
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t860 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t861 = phi i64 [ %t860, %then55_end ], [ 0, %else55_end ]
  %t862 = load i64, ptr %local.step.694
  %t863 = icmp eq i64 %t862, 199
  %t864 = zext i1 %t863 to i64
  %t865 = icmp ne i64 %t864, 0
  br i1 %t865, label %then57, label %else57
then57:
  %t866 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.134)
  %t867 = ptrtoint ptr %t866 to i64
  %t868 = inttoptr i64 %t867 to ptr
  call void @intrinsic_print(ptr %t868)
  %t869 = load i64, ptr %local.au2.708
  %t870 = call i64 @"print_f64"(i64 %t869)
  %t871 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.135)
  %t872 = ptrtoint ptr %t871 to i64
  %t873 = inttoptr i64 %t872 to ptr
  call void @intrinsic_print(ptr %t873)
  %t874 = load i64, ptr %local.window_avg.709
  %t875 = call i64 @"print_f64"(i64 %t874)
  %t876 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.136)
  %t877 = ptrtoint ptr %t876 to i64
  %t878 = inttoptr i64 %t877 to ptr
  call void @intrinsic_print(ptr %t878)
  %t879 = load i64, ptr %local.s_local.710
  %t880 = call i64 @"print_f64"(i64 %t879)
  %t881 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.137)
  %t882 = ptrtoint ptr %t881 to i64
  %t883 = inttoptr i64 %t882 to ptr
  call void @intrinsic_println(ptr %t883)
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t884 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t885 = load i64, ptr %local.step.694
  %t886 = icmp eq i64 %t885, 399
  %t887 = zext i1 %t886 to i64
  %t888 = icmp ne i64 %t887, 0
  br i1 %t888, label %then58, label %else58
then58:
  %t889 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.138)
  %t890 = ptrtoint ptr %t889 to i64
  %t891 = inttoptr i64 %t890 to ptr
  call void @intrinsic_print(ptr %t891)
  %t892 = load i64, ptr %local.au2.708
  %t893 = call i64 @"print_f64"(i64 %t892)
  %t894 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.139)
  %t895 = ptrtoint ptr %t894 to i64
  %t896 = inttoptr i64 %t895 to ptr
  call void @intrinsic_print(ptr %t896)
  %t897 = load i64, ptr %local.window_avg.709
  %t898 = call i64 @"print_f64"(i64 %t897)
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.140)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_print(ptr %t901)
  %t902 = load i64, ptr %local.s_local.710
  %t903 = call i64 @"print_f64"(i64 %t902)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.141)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t907 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t908 = load i64, ptr %local.step.694
  %t909 = icmp eq i64 %t908, 599
  %t910 = zext i1 %t909 to i64
  %t911 = icmp ne i64 %t910, 0
  br i1 %t911, label %then59, label %else59
then59:
  %t912 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.142)
  %t913 = ptrtoint ptr %t912 to i64
  %t914 = inttoptr i64 %t913 to ptr
  call void @intrinsic_print(ptr %t914)
  %t915 = load i64, ptr %local.au2.708
  %t916 = call i64 @"print_f64"(i64 %t915)
  %t917 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.143)
  %t918 = ptrtoint ptr %t917 to i64
  %t919 = inttoptr i64 %t918 to ptr
  call void @intrinsic_print(ptr %t919)
  %t920 = load i64, ptr %local.window_avg.709
  %t921 = call i64 @"print_f64"(i64 %t920)
  %t922 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.144)
  %t923 = ptrtoint ptr %t922 to i64
  %t924 = inttoptr i64 %t923 to ptr
  call void @intrinsic_print(ptr %t924)
  %t925 = load i64, ptr %local.s_local.710
  %t926 = call i64 @"print_f64"(i64 %t925)
  %t927 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.145)
  %t928 = ptrtoint ptr %t927 to i64
  %t929 = inttoptr i64 %t928 to ptr
  call void @intrinsic_println(ptr %t929)
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t930 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t931 = load i64, ptr %local.step.694
  %t932 = icmp eq i64 %t931, 799
  %t933 = zext i1 %t932 to i64
  %t934 = icmp ne i64 %t933, 0
  br i1 %t934, label %then60, label %else60
then60:
  %t935 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.146)
  %t936 = ptrtoint ptr %t935 to i64
  %t937 = inttoptr i64 %t936 to ptr
  call void @intrinsic_print(ptr %t937)
  %t938 = load i64, ptr %local.au2.708
  %t939 = call i64 @"print_f64"(i64 %t938)
  %t940 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.147)
  %t941 = ptrtoint ptr %t940 to i64
  %t942 = inttoptr i64 %t941 to ptr
  call void @intrinsic_print(ptr %t942)
  %t943 = load i64, ptr %local.window_avg.709
  %t944 = call i64 @"print_f64"(i64 %t943)
  %t945 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.148)
  %t946 = ptrtoint ptr %t945 to i64
  %t947 = inttoptr i64 %t946 to ptr
  call void @intrinsic_print(ptr %t947)
  %t948 = load i64, ptr %local.s_local.710
  %t949 = call i64 @"print_f64"(i64 %t948)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.149)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t953 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t954 = load i64, ptr %local.step.694
  %t955 = icmp eq i64 %t954, 999
  %t956 = zext i1 %t955 to i64
  %t957 = icmp ne i64 %t956, 0
  br i1 %t957, label %then61, label %else61
then61:
  %t958 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.150)
  %t959 = ptrtoint ptr %t958 to i64
  %t960 = inttoptr i64 %t959 to ptr
  call void @intrinsic_print(ptr %t960)
  %t961 = load i64, ptr %local.au2.708
  %t962 = call i64 @"print_f64"(i64 %t961)
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.151)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_print(ptr %t965)
  %t966 = load i64, ptr %local.window_avg.709
  %t967 = call i64 @"print_f64"(i64 %t966)
  %t968 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.152)
  %t969 = ptrtoint ptr %t968 to i64
  %t970 = inttoptr i64 %t969 to ptr
  call void @intrinsic_print(ptr %t970)
  %t971 = load i64, ptr %local.s_local.710
  %t972 = call i64 @"print_f64"(i64 %t971)
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.153)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_println(ptr %t975)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t976 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t977 = load i64, ptr %local.step.694
  %t978 = icmp eq i64 %t977, 1199
  %t979 = zext i1 %t978 to i64
  %t980 = icmp ne i64 %t979, 0
  br i1 %t980, label %then62, label %else62
then62:
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.154)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_print(ptr %t983)
  %t984 = load i64, ptr %local.au2.708
  %t985 = call i64 @"print_f64"(i64 %t984)
  %t986 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.155)
  %t987 = ptrtoint ptr %t986 to i64
  %t988 = inttoptr i64 %t987 to ptr
  call void @intrinsic_print(ptr %t988)
  %t989 = load i64, ptr %local.window_avg.709
  %t990 = call i64 @"print_f64"(i64 %t989)
  %t991 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.156)
  %t992 = ptrtoint ptr %t991 to i64
  %t993 = inttoptr i64 %t992 to ptr
  call void @intrinsic_print(ptr %t993)
  %t994 = load i64, ptr %local.s_local.710
  %t995 = call i64 @"print_f64"(i64 %t994)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.157)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_println(ptr %t998)
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t999 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t1000 = load i64, ptr %local.step.694
  %t1001 = icmp eq i64 %t1000, 1499
  %t1002 = zext i1 %t1001 to i64
  %t1003 = icmp ne i64 %t1002, 0
  br i1 %t1003, label %then63, label %else63
then63:
  %t1004 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.158)
  %t1005 = ptrtoint ptr %t1004 to i64
  %t1006 = inttoptr i64 %t1005 to ptr
  call void @intrinsic_print(ptr %t1006)
  %t1007 = load i64, ptr %local.au2.708
  %t1008 = call i64 @"print_f64"(i64 %t1007)
  %t1009 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.159)
  %t1010 = ptrtoint ptr %t1009 to i64
  %t1011 = inttoptr i64 %t1010 to ptr
  call void @intrinsic_print(ptr %t1011)
  %t1012 = load i64, ptr %local.window_avg.709
  %t1013 = call i64 @"print_f64"(i64 %t1012)
  %t1014 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.160)
  %t1015 = ptrtoint ptr %t1014 to i64
  %t1016 = inttoptr i64 %t1015 to ptr
  call void @intrinsic_print(ptr %t1016)
  %t1017 = load i64, ptr %local.s_local.710
  %t1018 = call i64 @"print_f64"(i64 %t1017)
  %t1019 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.161)
  %t1020 = ptrtoint ptr %t1019 to i64
  %t1021 = inttoptr i64 %t1020 to ptr
  call void @intrinsic_println(ptr %t1021)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1022 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1023 = load i64, ptr %local.step.694
  %t1024 = icmp eq i64 %t1023, 1799
  %t1025 = zext i1 %t1024 to i64
  %t1026 = icmp ne i64 %t1025, 0
  br i1 %t1026, label %then64, label %else64
then64:
  %t1027 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.162)
  %t1028 = ptrtoint ptr %t1027 to i64
  %t1029 = inttoptr i64 %t1028 to ptr
  call void @intrinsic_print(ptr %t1029)
  %t1030 = load i64, ptr %local.au2.708
  %t1031 = call i64 @"print_f64"(i64 %t1030)
  %t1032 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.163)
  %t1033 = ptrtoint ptr %t1032 to i64
  %t1034 = inttoptr i64 %t1033 to ptr
  call void @intrinsic_print(ptr %t1034)
  %t1035 = load i64, ptr %local.window_avg.709
  %t1036 = call i64 @"print_f64"(i64 %t1035)
  %t1037 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.164)
  %t1038 = ptrtoint ptr %t1037 to i64
  %t1039 = inttoptr i64 %t1038 to ptr
  call void @intrinsic_print(ptr %t1039)
  %t1040 = load i64, ptr %local.s_local.710
  %t1041 = call i64 @"print_f64"(i64 %t1040)
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.165)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_println(ptr %t1044)
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t1045 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t1046 = load i64, ptr %local.step.694
  %t1047 = icmp eq i64 %t1046, 1999
  %t1048 = zext i1 %t1047 to i64
  %t1049 = icmp ne i64 %t1048, 0
  br i1 %t1049, label %then65, label %else65
then65:
  %t1050 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.166)
  %t1051 = ptrtoint ptr %t1050 to i64
  %t1052 = inttoptr i64 %t1051 to ptr
  call void @intrinsic_print(ptr %t1052)
  %t1053 = load i64, ptr %local.au2.708
  %t1054 = call i64 @"print_f64"(i64 %t1053)
  %t1055 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.167)
  %t1056 = ptrtoint ptr %t1055 to i64
  %t1057 = inttoptr i64 %t1056 to ptr
  call void @intrinsic_print(ptr %t1057)
  %t1058 = load i64, ptr %local.window_avg.709
  %t1059 = call i64 @"print_f64"(i64 %t1058)
  %t1060 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.168)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = inttoptr i64 %t1061 to ptr
  call void @intrinsic_print(ptr %t1062)
  %t1063 = load i64, ptr %local.s_local.710
  %t1064 = call i64 @"print_f64"(i64 %t1063)
  %t1065 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.169)
  %t1066 = ptrtoint ptr %t1065 to i64
  %t1067 = inttoptr i64 %t1066 to ptr
  call void @intrinsic_println(ptr %t1067)
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t1068 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t1069 = load i64, ptr %local.window_avg.709
  store i64 %t1069, ptr %local.prev_window_avg.698
  %t1070 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.170)
  store i64 %t1070, ptr %local.window_sum.696
  store i64 0, ptr %local.window_count.697
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1071 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1072 = load i64, ptr %local.u2.691
  store i64 %t1072, ptr %local.prev_u2.695
  %t1073 = load i64, ptr %local.step.694
  %t1074 = add i64 %t1073, 1
  store i64 %t1074, ptr %local.step.694
  br label %loop49
endloop49:
  %t1075 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.171)
  %t1076 = ptrtoint ptr %t1075 to i64
  %t1077 = inttoptr i64 %t1076 to ptr
  call void @intrinsic_println(ptr %t1077)
  %t1078 = load i64, ptr %local.s_neg_step.701
  %t1079 = icmp sge i64 %t1078, 0
  %t1080 = zext i1 %t1079 to i64
  %t1081 = icmp ne i64 %t1080, 0
  br i1 %t1081, label %then66, label %else66
then66:
  %t1082 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.172)
  %t1083 = ptrtoint ptr %t1082 to i64
  %t1084 = inttoptr i64 %t1083 to ptr
  call void @intrinsic_print(ptr %t1084)
  %t1085 = load i64, ptr %local.s_neg_step.701
  call void @print_i64(i64 %t1085)
  %t1086 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.173)
  %t1087 = ptrtoint ptr %t1086 to i64
  %t1088 = inttoptr i64 %t1087 to ptr
  call void @intrinsic_println(ptr %t1088)
  br label %then66_end
then66_end:
  br label %endif66
else66:
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.174)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_println(ptr %t1091)
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t1092 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  %t1093 = load i64, ptr %local.blowup_step.700
  %t1094 = icmp sge i64 %t1093, 0
  %t1095 = zext i1 %t1094 to i64
  %t1096 = icmp ne i64 %t1095, 0
  br i1 %t1096, label %then67, label %else67
then67:
  %t1097 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.175)
  %t1098 = ptrtoint ptr %t1097 to i64
  %t1099 = inttoptr i64 %t1098 to ptr
  call void @intrinsic_print(ptr %t1099)
  %t1100 = load i64, ptr %local.blowup_step.700
  call void @print_i64(i64 %t1100)
  %t1101 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.176)
  %t1102 = ptrtoint ptr %t1101 to i64
  %t1103 = inttoptr i64 %t1102 to ptr
  call void @intrinsic_println(ptr %t1103)
  br label %then67_end
then67_end:
  br label %endif67
else67:
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.177)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_println(ptr %t1106)
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1107 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  %t1108 = load i64, ptr %local.s_neg_step.701
  %t1109 = icmp sge i64 %t1108, 0
  %t1110 = zext i1 %t1109 to i64
  %t1111 = icmp ne i64 %t1110, 0
  br i1 %t1111, label %then68, label %else68
then68:
  %t1112 = load i64, ptr %local.blowup_step.700
  %t1113 = icmp sge i64 %t1112, 0
  %t1114 = zext i1 %t1113 to i64
  %t1115 = icmp ne i64 %t1114, 0
  br i1 %t1115, label %then69, label %else69
then69:
  %t1116 = load i64, ptr %local.s_neg_step.701
  %t1117 = load i64, ptr %local.blowup_step.700
  %t1118 = icmp slt i64 %t1116, %t1117
  %t1119 = zext i1 %t1118 to i64
  %t1120 = icmp ne i64 %t1119, 0
  br i1 %t1120, label %then70, label %else70
then70:
  %t1121 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.178)
  %t1122 = ptrtoint ptr %t1121 to i64
  %t1123 = inttoptr i64 %t1122 to ptr
  call void @intrinsic_println(ptr %t1123)
  br label %then70_end
then70_end:
  br label %endif70
else70:
  %t1124 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.179)
  %t1125 = ptrtoint ptr %t1124 to i64
  %t1126 = inttoptr i64 %t1125 to ptr
  call void @intrinsic_println(ptr %t1126)
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t1127 = phi i64 [ 0, %then70_end ], [ 0, %else70_end ]
  br label %then69_end
then69_end:
  br label %endif69
else69:
  %t1128 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.180)
  %t1129 = ptrtoint ptr %t1128 to i64
  %t1130 = inttoptr i64 %t1129 to ptr
  call void @intrinsic_println(ptr %t1130)
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t1131 = phi i64 [ %t1127, %then69_end ], [ 0, %else69_end ]
  br label %then68_end
then68_end:
  br label %endif68
else68:
  %t1132 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.181)
  %t1133 = ptrtoint ptr %t1132 to i64
  %t1134 = inttoptr i64 %t1133 to ptr
  call void @intrinsic_println(ptr %t1134)
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t1135 = phi i64 [ %t1131, %then68_end ], [ 0, %else68_end ]
  %t1136 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.182)
  %t1137 = ptrtoint ptr %t1136 to i64
  %t1138 = inttoptr i64 %t1137 to ptr
  call void @intrinsic_println(ptr %t1138)
  ret i64 0
}

define i64 @"run_comparison"(i64 %nu, i64 %label_lam) nounwind {
entry:
  %local.dx.1139 = alloca i64
  %local.dt.1140 = alloca i64
  %local.u0.1141 = alloca i64
  %local.u1.1142 = alloca i64
  %local.u2.1143 = alloca i64
  %local.u3.1144 = alloca i64
  %local.u4.1145 = alloca i64
  %local.step.1146 = alloca i64
  %local.prev_u2.1147 = alloca i64
  %local.early_drift.1148 = alloca i64
  %local.late_drift.1149 = alloca i64
  %local.count_e.1150 = alloca i64
  %local.count_l.1151 = alloca i64
  %local.new_u0.1152 = alloca i64
  %local.new_u1.1153 = alloca i64
  %local.new_u2.1154 = alloca i64
  %local.new_u3.1155 = alloca i64
  %local.new_u4.1156 = alloca i64
  %local.drift.1157 = alloca i64
  %local.f_a.1158 = alloca i64
  %local.f_d.1159 = alloca i64
  %local.ir.1160 = alloca i64
  %local.f_a.1161 = alloca i64
  %local.f_d.1162 = alloca i64
  %local.ir.1163 = alloca i64
  %local.f_a.1164 = alloca i64
  %local.f_d.1165 = alloca i64
  %local.ir.1166 = alloca i64
  %local.f_a.1167 = alloca i64
  %local.f_d.1168 = alloca i64
  %local.ir.1169 = alloca i64
  %local.ss.1170 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.label_lam = alloca i64
  store i64 %label_lam, ptr %local.label_lam
  %t1171 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.183)
  store i64 %t1171, ptr %local.dx.1139
  %t1172 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.184)
  store i64 %t1172, ptr %local.dt.1140
  %t1173 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.185)
  %t1174 = call i64 @"u_init"(i64 %t1173)
  store i64 %t1174, ptr %local.u0.1141
  %t1175 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.186)
  %t1176 = call i64 @"u_init"(i64 %t1175)
  store i64 %t1176, ptr %local.u1.1142
  %t1177 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.187)
  %t1178 = call i64 @"u_init"(i64 %t1177)
  store i64 %t1178, ptr %local.u2.1143
  %t1179 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.188)
  %t1180 = call i64 @"u_init"(i64 %t1179)
  store i64 %t1180, ptr %local.u3.1144
  %t1181 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.189)
  %t1182 = call i64 @"u_init"(i64 %t1181)
  store i64 %t1182, ptr %local.u4.1145
  store i64 0, ptr %local.step.1146
  %t1183 = load i64, ptr %local.u2.1143
  store i64 %t1183, ptr %local.prev_u2.1147
  %t1184 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.190)
  store i64 %t1184, ptr %local.early_drift.1148
  %t1185 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.191)
  store i64 %t1185, ptr %local.late_drift.1149
  store i64 0, ptr %local.count_e.1150
  store i64 0, ptr %local.count_l.1151
  %t1186 = load i64, ptr %local.label_lam
  %t1187 = icmp eq i64 %t1186, 1
  %t1188 = zext i1 %t1187 to i64
  %t1189 = icmp ne i64 %t1188, 0
  br i1 %t1189, label %then71, label %else71
then71:
  %t1190 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.192)
  %t1191 = ptrtoint ptr %t1190 to i64
  %t1192 = inttoptr i64 %t1191 to ptr
  call void @intrinsic_print(ptr %t1192)
  br label %then71_end
then71_end:
  br label %endif71
else71:
  %t1193 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.193)
  %t1194 = ptrtoint ptr %t1193 to i64
  %t1195 = inttoptr i64 %t1194 to ptr
  call void @intrinsic_print(ptr %t1195)
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t1196 = phi i64 [ 0, %then71_end ], [ 0, %else71_end ]
  %t1197 = load i64, ptr %local.nu
  %t1198 = call i64 @"print_f64"(i64 %t1197)
  %t1199 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.194)
  %t1200 = ptrtoint ptr %t1199 to i64
  %t1201 = inttoptr i64 %t1200 to ptr
  call void @intrinsic_println(ptr %t1201)
  %t1202 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.195)
  %t1203 = ptrtoint ptr %t1202 to i64
  %t1204 = inttoptr i64 %t1203 to ptr
  call void @intrinsic_println(ptr %t1204)
  br label %loop72
loop72:
  %t1205 = load i64, ptr %local.step.1146
  %t1206 = icmp slt i64 %t1205, 1000
  %t1207 = zext i1 %t1206 to i64
  %t1208 = icmp ne i64 %t1207, 0
  br i1 %t1208, label %body72, label %endloop72
body72:
  %t1209 = load i64, ptr %local.u4.1145
  %t1210 = load i64, ptr %local.u0.1141
  %t1211 = load i64, ptr %local.u1.1142
  %t1212 = load i64, ptr %local.u2.1143
  %t1213 = load i64, ptr %local.u3.1144
  %t1214 = load i64, ptr %local.nu
  %t1215 = load i64, ptr %local.dt.1140
  %t1216 = load i64, ptr %local.dx.1139
  %t1217 = call i64 @"burgers_step"(i64 %t1209, i64 %t1210, i64 %t1211, i64 %t1212, i64 %t1213, i64 %t1214, i64 %t1215, i64 %t1216)
  store i64 %t1217, ptr %local.new_u0.1152
  %t1218 = load i64, ptr %local.u0.1141
  %t1219 = load i64, ptr %local.u1.1142
  %t1220 = load i64, ptr %local.u2.1143
  %t1221 = load i64, ptr %local.u3.1144
  %t1222 = load i64, ptr %local.u4.1145
  %t1223 = load i64, ptr %local.nu
  %t1224 = load i64, ptr %local.dt.1140
  %t1225 = load i64, ptr %local.dx.1139
  %t1226 = call i64 @"burgers_step"(i64 %t1218, i64 %t1219, i64 %t1220, i64 %t1221, i64 %t1222, i64 %t1223, i64 %t1224, i64 %t1225)
  store i64 %t1226, ptr %local.new_u1.1153
  %t1227 = load i64, ptr %local.u1.1142
  %t1228 = load i64, ptr %local.u2.1143
  %t1229 = load i64, ptr %local.u3.1144
  %t1230 = load i64, ptr %local.u4.1145
  %t1231 = load i64, ptr %local.u0.1141
  %t1232 = load i64, ptr %local.nu
  %t1233 = load i64, ptr %local.dt.1140
  %t1234 = load i64, ptr %local.dx.1139
  %t1235 = call i64 @"burgers_step"(i64 %t1227, i64 %t1228, i64 %t1229, i64 %t1230, i64 %t1231, i64 %t1232, i64 %t1233, i64 %t1234)
  store i64 %t1235, ptr %local.new_u2.1154
  %t1236 = load i64, ptr %local.u2.1143
  %t1237 = load i64, ptr %local.u3.1144
  %t1238 = load i64, ptr %local.u4.1145
  %t1239 = load i64, ptr %local.u0.1141
  %t1240 = load i64, ptr %local.u1.1142
  %t1241 = load i64, ptr %local.nu
  %t1242 = load i64, ptr %local.dt.1140
  %t1243 = load i64, ptr %local.dx.1139
  %t1244 = call i64 @"burgers_step"(i64 %t1236, i64 %t1237, i64 %t1238, i64 %t1239, i64 %t1240, i64 %t1241, i64 %t1242, i64 %t1243)
  store i64 %t1244, ptr %local.new_u3.1155
  %t1245 = load i64, ptr %local.u3.1144
  %t1246 = load i64, ptr %local.u4.1145
  %t1247 = load i64, ptr %local.u0.1141
  %t1248 = load i64, ptr %local.u1.1142
  %t1249 = load i64, ptr %local.u2.1143
  %t1250 = load i64, ptr %local.nu
  %t1251 = load i64, ptr %local.dt.1140
  %t1252 = load i64, ptr %local.dx.1139
  %t1253 = call i64 @"burgers_step"(i64 %t1245, i64 %t1246, i64 %t1247, i64 %t1248, i64 %t1249, i64 %t1250, i64 %t1251, i64 %t1252)
  store i64 %t1253, ptr %local.new_u4.1156
  %t1254 = load i64, ptr %local.new_u0.1152
  store i64 %t1254, ptr %local.u0.1141
  %t1255 = load i64, ptr %local.new_u1.1153
  store i64 %t1255, ptr %local.u1.1142
  %t1256 = load i64, ptr %local.new_u2.1154
  store i64 %t1256, ptr %local.u2.1143
  %t1257 = load i64, ptr %local.new_u3.1155
  store i64 %t1257, ptr %local.u3.1144
  %t1258 = load i64, ptr %local.new_u4.1156
  store i64 %t1258, ptr %local.u4.1145
  %t1259 = load i64, ptr %local.u0.1141
  %t1260 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.196)
  %t1261 = call i64 @"sx_f64_gt"(i64 %t1259, i64 %t1260)
  %t1262 = icmp ne i64 %t1261, 0
  br i1 %t1262, label %then73, label %else73
then73:
  %t1263 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.197)
  store i64 %t1263, ptr %local.u0.1141
  br label %then73_end
then73_end:
  br label %endif73
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t1264 = phi i64 [ 0, %then73_end ], [ 0, %else73_end ]
  %t1265 = load i64, ptr %local.u0.1141
  %t1266 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.198)
  %t1267 = xor i64 %t1266, -9223372036854775808
  %t1268 = call i64 @"sx_f64_lt"(i64 %t1265, i64 %t1267)
  %t1269 = icmp ne i64 %t1268, 0
  br i1 %t1269, label %then74, label %else74
then74:
  %t1270 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.199)
  %t1271 = xor i64 %t1270, -9223372036854775808
  store i64 %t1271, ptr %local.u0.1141
  br label %then74_end
then74_end:
  br label %endif74
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t1272 = phi i64 [ 0, %then74_end ], [ 0, %else74_end ]
  %t1273 = load i64, ptr %local.u1.1142
  %t1274 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.200)
  %t1275 = call i64 @"sx_f64_gt"(i64 %t1273, i64 %t1274)
  %t1276 = icmp ne i64 %t1275, 0
  br i1 %t1276, label %then75, label %else75
then75:
  %t1277 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.201)
  store i64 %t1277, ptr %local.u1.1142
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t1278 = phi i64 [ 0, %then75_end ], [ 0, %else75_end ]
  %t1279 = load i64, ptr %local.u1.1142
  %t1280 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.202)
  %t1281 = xor i64 %t1280, -9223372036854775808
  %t1282 = call i64 @"sx_f64_lt"(i64 %t1279, i64 %t1281)
  %t1283 = icmp ne i64 %t1282, 0
  br i1 %t1283, label %then76, label %else76
then76:
  %t1284 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.203)
  %t1285 = xor i64 %t1284, -9223372036854775808
  store i64 %t1285, ptr %local.u1.1142
  br label %then76_end
then76_end:
  br label %endif76
else76:
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t1286 = phi i64 [ 0, %then76_end ], [ 0, %else76_end ]
  %t1287 = load i64, ptr %local.u2.1143
  %t1288 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.204)
  %t1289 = call i64 @"sx_f64_gt"(i64 %t1287, i64 %t1288)
  %t1290 = icmp ne i64 %t1289, 0
  br i1 %t1290, label %then77, label %else77
then77:
  %t1291 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.205)
  store i64 %t1291, ptr %local.u2.1143
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t1292 = phi i64 [ 0, %then77_end ], [ 0, %else77_end ]
  %t1293 = load i64, ptr %local.u2.1143
  %t1294 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.206)
  %t1295 = xor i64 %t1294, -9223372036854775808
  %t1296 = call i64 @"sx_f64_lt"(i64 %t1293, i64 %t1295)
  %t1297 = icmp ne i64 %t1296, 0
  br i1 %t1297, label %then78, label %else78
then78:
  %t1298 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.207)
  %t1299 = xor i64 %t1298, -9223372036854775808
  store i64 %t1299, ptr %local.u2.1143
  br label %then78_end
then78_end:
  br label %endif78
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t1300 = phi i64 [ 0, %then78_end ], [ 0, %else78_end ]
  %t1301 = load i64, ptr %local.u3.1144
  %t1302 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.208)
  %t1303 = call i64 @"sx_f64_gt"(i64 %t1301, i64 %t1302)
  %t1304 = icmp ne i64 %t1303, 0
  br i1 %t1304, label %then79, label %else79
then79:
  %t1305 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.209)
  store i64 %t1305, ptr %local.u3.1144
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t1306 = phi i64 [ 0, %then79_end ], [ 0, %else79_end ]
  %t1307 = load i64, ptr %local.u3.1144
  %t1308 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.210)
  %t1309 = xor i64 %t1308, -9223372036854775808
  %t1310 = call i64 @"sx_f64_lt"(i64 %t1307, i64 %t1309)
  %t1311 = icmp ne i64 %t1310, 0
  br i1 %t1311, label %then80, label %else80
then80:
  %t1312 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.211)
  %t1313 = xor i64 %t1312, -9223372036854775808
  store i64 %t1313, ptr %local.u3.1144
  br label %then80_end
then80_end:
  br label %endif80
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t1314 = phi i64 [ 0, %then80_end ], [ 0, %else80_end ]
  %t1315 = load i64, ptr %local.u4.1145
  %t1316 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.212)
  %t1317 = call i64 @"sx_f64_gt"(i64 %t1315, i64 %t1316)
  %t1318 = icmp ne i64 %t1317, 0
  br i1 %t1318, label %then81, label %else81
then81:
  %t1319 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.213)
  store i64 %t1319, ptr %local.u4.1145
  br label %then81_end
then81_end:
  br label %endif81
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t1320 = phi i64 [ 0, %then81_end ], [ 0, %else81_end ]
  %t1321 = load i64, ptr %local.u4.1145
  %t1322 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.214)
  %t1323 = xor i64 %t1322, -9223372036854775808
  %t1324 = call i64 @"sx_f64_lt"(i64 %t1321, i64 %t1323)
  %t1325 = icmp ne i64 %t1324, 0
  br i1 %t1325, label %then82, label %else82
then82:
  %t1326 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.215)
  %t1327 = xor i64 %t1326, -9223372036854775808
  store i64 %t1327, ptr %local.u4.1145
  br label %then82_end
then82_end:
  br label %endif82
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t1328 = phi i64 [ 0, %then82_end ], [ 0, %else82_end ]
  %t1329 = load i64, ptr %local.u2.1143
  %t1330 = load i64, ptr %local.prev_u2.1147
  %t1331 = call i64 @"sx_f64_sub"(i64 %t1329, i64 %t1330)
  %t1332 = call i64 @"abs_f64"(i64 %t1331)
  store i64 %t1332, ptr %local.drift.1157
  %t1333 = load i64, ptr %local.step.1146
  %t1334 = icmp sge i64 %t1333, 50
  %t1335 = zext i1 %t1334 to i64
  %t1336 = icmp ne i64 %t1335, 0
  br i1 %t1336, label %then83, label %else83
then83:
  %t1337 = load i64, ptr %local.step.1146
  %t1338 = icmp slt i64 %t1337, 300
  %t1339 = zext i1 %t1338 to i64
  %t1340 = icmp ne i64 %t1339, 0
  br i1 %t1340, label %then84, label %else84
then84:
  %t1341 = load i64, ptr %local.early_drift.1148
  %t1342 = load i64, ptr %local.drift.1157
  %t1343 = call i64 @"sx_f64_add"(i64 %t1341, i64 %t1342)
  store i64 %t1343, ptr %local.early_drift.1148
  %t1344 = load i64, ptr %local.count_e.1150
  %t1345 = add i64 %t1344, 1
  store i64 %t1345, ptr %local.count_e.1150
  br label %then84_end
then84_end:
  br label %endif84
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t1346 = phi i64 [ 0, %then84_end ], [ 0, %else84_end ]
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t1347 = phi i64 [ %t1346, %then83_end ], [ 0, %else83_end ]
  %t1348 = load i64, ptr %local.step.1146
  %t1349 = icmp sge i64 %t1348, 700
  %t1350 = zext i1 %t1349 to i64
  %t1351 = icmp ne i64 %t1350, 0
  br i1 %t1351, label %then85, label %else85
then85:
  %t1352 = load i64, ptr %local.late_drift.1149
  %t1353 = load i64, ptr %local.drift.1157
  %t1354 = call i64 @"sx_f64_add"(i64 %t1352, i64 %t1353)
  store i64 %t1354, ptr %local.late_drift.1149
  %t1355 = load i64, ptr %local.count_l.1151
  %t1356 = add i64 %t1355, 1
  store i64 %t1356, ptr %local.count_l.1151
  br label %then85_end
then85_end:
  br label %endif85
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t1357 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  %t1358 = load i64, ptr %local.step.1146
  %t1359 = icmp eq i64 %t1358, 0
  %t1360 = zext i1 %t1359 to i64
  %t1361 = icmp ne i64 %t1360, 0
  br i1 %t1361, label %then86, label %else86
then86:
  %t1362 = load i64, ptr %local.u1.1142
  %t1363 = load i64, ptr %local.u2.1143
  %t1364 = load i64, ptr %local.u3.1144
  %t1365 = load i64, ptr %local.dx.1139
  %t1366 = call i64 @"advection_force"(i64 %t1362, i64 %t1363, i64 %t1364, i64 %t1365)
  store i64 %t1366, ptr %local.f_a.1158
  %t1367 = load i64, ptr %local.u1.1142
  %t1368 = load i64, ptr %local.u2.1143
  %t1369 = load i64, ptr %local.u3.1144
  %t1370 = load i64, ptr %local.nu
  %t1371 = load i64, ptr %local.dx.1139
  %t1372 = call i64 @"diffusion_force"(i64 %t1367, i64 %t1368, i64 %t1369, i64 %t1370, i64 %t1371)
  store i64 %t1372, ptr %local.f_d.1159
  %t1373 = load i64, ptr %local.f_a.1158
  %t1374 = load i64, ptr %local.f_d.1159
  %t1375 = call i64 @"iratio_2force"(i64 %t1373, i64 %t1374)
  store i64 %t1375, ptr %local.ir.1160
  %t1376 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.216)
  %t1377 = ptrtoint ptr %t1376 to i64
  %t1378 = inttoptr i64 %t1377 to ptr
  call void @intrinsic_print(ptr %t1378)
  %t1379 = load i64, ptr %local.u2.1143
  %t1380 = call i64 @"abs_f64"(i64 %t1379)
  %t1381 = call i64 @"print_f64"(i64 %t1380)
  %t1382 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.217)
  %t1383 = ptrtoint ptr %t1382 to i64
  %t1384 = inttoptr i64 %t1383 to ptr
  call void @intrinsic_print(ptr %t1384)
  %t1385 = load i64, ptr %local.ir.1160
  %t1386 = call i64 @"print_f64"(i64 %t1385)
  %t1387 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.218)
  %t1388 = ptrtoint ptr %t1387 to i64
  %t1389 = inttoptr i64 %t1388 to ptr
  call void @intrinsic_println(ptr %t1389)
  br label %then86_end
then86_end:
  br label %endif86
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t1390 = phi i64 [ 0, %then86_end ], [ 0, %else86_end ]
  %t1391 = load i64, ptr %local.step.1146
  %t1392 = icmp eq i64 %t1391, 200
  %t1393 = zext i1 %t1392 to i64
  %t1394 = icmp ne i64 %t1393, 0
  br i1 %t1394, label %then87, label %else87
then87:
  %t1395 = load i64, ptr %local.u1.1142
  %t1396 = load i64, ptr %local.u2.1143
  %t1397 = load i64, ptr %local.u3.1144
  %t1398 = load i64, ptr %local.dx.1139
  %t1399 = call i64 @"advection_force"(i64 %t1395, i64 %t1396, i64 %t1397, i64 %t1398)
  store i64 %t1399, ptr %local.f_a.1161
  %t1400 = load i64, ptr %local.u1.1142
  %t1401 = load i64, ptr %local.u2.1143
  %t1402 = load i64, ptr %local.u3.1144
  %t1403 = load i64, ptr %local.nu
  %t1404 = load i64, ptr %local.dx.1139
  %t1405 = call i64 @"diffusion_force"(i64 %t1400, i64 %t1401, i64 %t1402, i64 %t1403, i64 %t1404)
  store i64 %t1405, ptr %local.f_d.1162
  %t1406 = load i64, ptr %local.f_a.1161
  %t1407 = load i64, ptr %local.f_d.1162
  %t1408 = call i64 @"iratio_2force"(i64 %t1406, i64 %t1407)
  store i64 %t1408, ptr %local.ir.1163
  %t1409 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.219)
  %t1410 = ptrtoint ptr %t1409 to i64
  %t1411 = inttoptr i64 %t1410 to ptr
  call void @intrinsic_print(ptr %t1411)
  %t1412 = load i64, ptr %local.u2.1143
  %t1413 = call i64 @"abs_f64"(i64 %t1412)
  %t1414 = call i64 @"print_f64"(i64 %t1413)
  %t1415 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.220)
  %t1416 = ptrtoint ptr %t1415 to i64
  %t1417 = inttoptr i64 %t1416 to ptr
  call void @intrinsic_print(ptr %t1417)
  %t1418 = load i64, ptr %local.ir.1163
  %t1419 = call i64 @"print_f64"(i64 %t1418)
  %t1420 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.221)
  %t1421 = ptrtoint ptr %t1420 to i64
  %t1422 = inttoptr i64 %t1421 to ptr
  call void @intrinsic_println(ptr %t1422)
  br label %then87_end
then87_end:
  br label %endif87
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t1423 = phi i64 [ 0, %then87_end ], [ 0, %else87_end ]
  %t1424 = load i64, ptr %local.step.1146
  %t1425 = icmp eq i64 %t1424, 500
  %t1426 = zext i1 %t1425 to i64
  %t1427 = icmp ne i64 %t1426, 0
  br i1 %t1427, label %then88, label %else88
then88:
  %t1428 = load i64, ptr %local.u1.1142
  %t1429 = load i64, ptr %local.u2.1143
  %t1430 = load i64, ptr %local.u3.1144
  %t1431 = load i64, ptr %local.dx.1139
  %t1432 = call i64 @"advection_force"(i64 %t1428, i64 %t1429, i64 %t1430, i64 %t1431)
  store i64 %t1432, ptr %local.f_a.1164
  %t1433 = load i64, ptr %local.u1.1142
  %t1434 = load i64, ptr %local.u2.1143
  %t1435 = load i64, ptr %local.u3.1144
  %t1436 = load i64, ptr %local.nu
  %t1437 = load i64, ptr %local.dx.1139
  %t1438 = call i64 @"diffusion_force"(i64 %t1433, i64 %t1434, i64 %t1435, i64 %t1436, i64 %t1437)
  store i64 %t1438, ptr %local.f_d.1165
  %t1439 = load i64, ptr %local.f_a.1164
  %t1440 = load i64, ptr %local.f_d.1165
  %t1441 = call i64 @"iratio_2force"(i64 %t1439, i64 %t1440)
  store i64 %t1441, ptr %local.ir.1166
  %t1442 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.222)
  %t1443 = ptrtoint ptr %t1442 to i64
  %t1444 = inttoptr i64 %t1443 to ptr
  call void @intrinsic_print(ptr %t1444)
  %t1445 = load i64, ptr %local.u2.1143
  %t1446 = call i64 @"abs_f64"(i64 %t1445)
  %t1447 = call i64 @"print_f64"(i64 %t1446)
  %t1448 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.223)
  %t1449 = ptrtoint ptr %t1448 to i64
  %t1450 = inttoptr i64 %t1449 to ptr
  call void @intrinsic_print(ptr %t1450)
  %t1451 = load i64, ptr %local.ir.1166
  %t1452 = call i64 @"print_f64"(i64 %t1451)
  %t1453 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.224)
  %t1454 = ptrtoint ptr %t1453 to i64
  %t1455 = inttoptr i64 %t1454 to ptr
  call void @intrinsic_println(ptr %t1455)
  br label %then88_end
then88_end:
  br label %endif88
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t1456 = phi i64 [ 0, %then88_end ], [ 0, %else88_end ]
  %t1457 = load i64, ptr %local.step.1146
  %t1458 = icmp eq i64 %t1457, 999
  %t1459 = zext i1 %t1458 to i64
  %t1460 = icmp ne i64 %t1459, 0
  br i1 %t1460, label %then89, label %else89
then89:
  %t1461 = load i64, ptr %local.u1.1142
  %t1462 = load i64, ptr %local.u2.1143
  %t1463 = load i64, ptr %local.u3.1144
  %t1464 = load i64, ptr %local.dx.1139
  %t1465 = call i64 @"advection_force"(i64 %t1461, i64 %t1462, i64 %t1463, i64 %t1464)
  store i64 %t1465, ptr %local.f_a.1167
  %t1466 = load i64, ptr %local.u1.1142
  %t1467 = load i64, ptr %local.u2.1143
  %t1468 = load i64, ptr %local.u3.1144
  %t1469 = load i64, ptr %local.nu
  %t1470 = load i64, ptr %local.dx.1139
  %t1471 = call i64 @"diffusion_force"(i64 %t1466, i64 %t1467, i64 %t1468, i64 %t1469, i64 %t1470)
  store i64 %t1471, ptr %local.f_d.1168
  %t1472 = load i64, ptr %local.f_a.1167
  %t1473 = load i64, ptr %local.f_d.1168
  %t1474 = call i64 @"iratio_2force"(i64 %t1472, i64 %t1473)
  store i64 %t1474, ptr %local.ir.1169
  %t1475 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.225)
  %t1476 = ptrtoint ptr %t1475 to i64
  %t1477 = inttoptr i64 %t1476 to ptr
  call void @intrinsic_print(ptr %t1477)
  %t1478 = load i64, ptr %local.u2.1143
  %t1479 = call i64 @"abs_f64"(i64 %t1478)
  %t1480 = call i64 @"print_f64"(i64 %t1479)
  %t1481 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.226)
  %t1482 = ptrtoint ptr %t1481 to i64
  %t1483 = inttoptr i64 %t1482 to ptr
  call void @intrinsic_print(ptr %t1483)
  %t1484 = load i64, ptr %local.ir.1169
  %t1485 = call i64 @"print_f64"(i64 %t1484)
  %t1486 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.227)
  %t1487 = ptrtoint ptr %t1486 to i64
  %t1488 = inttoptr i64 %t1487 to ptr
  call void @intrinsic_println(ptr %t1488)
  br label %then89_end
then89_end:
  br label %endif89
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t1489 = phi i64 [ 0, %then89_end ], [ 0, %else89_end ]
  %t1490 = load i64, ptr %local.u2.1143
  store i64 %t1490, ptr %local.prev_u2.1147
  %t1491 = load i64, ptr %local.step.1146
  %t1492 = add i64 %t1491, 1
  store i64 %t1492, ptr %local.step.1146
  br label %loop72
endloop72:
  %t1493 = load i64, ptr %local.count_e.1150
  %t1494 = icmp sgt i64 %t1493, 0
  %t1495 = zext i1 %t1494 to i64
  %t1496 = icmp ne i64 %t1495, 0
  br i1 %t1496, label %then90, label %else90
then90:
  %t1497 = load i64, ptr %local.early_drift.1148
  %t1498 = load i64, ptr %local.count_e.1150
  %t1499 = call i64 @"sx_int_to_f64"(i64 %t1498)
  %t1500 = call i64 @"sx_f64_div"(i64 %t1497, i64 %t1499)
  store i64 %t1500, ptr %local.early_drift.1148
  br label %then90_end
then90_end:
  br label %endif90
else90:
  br label %else90_end
else90_end:
  br label %endif90
endif90:
  %t1501 = phi i64 [ 0, %then90_end ], [ 0, %else90_end ]
  %t1502 = load i64, ptr %local.count_l.1151
  %t1503 = icmp sgt i64 %t1502, 0
  %t1504 = zext i1 %t1503 to i64
  %t1505 = icmp ne i64 %t1504, 0
  br i1 %t1505, label %then91, label %else91
then91:
  %t1506 = load i64, ptr %local.late_drift.1149
  %t1507 = load i64, ptr %local.count_l.1151
  %t1508 = call i64 @"sx_int_to_f64"(i64 %t1507)
  %t1509 = call i64 @"sx_f64_div"(i64 %t1506, i64 %t1508)
  store i64 %t1509, ptr %local.late_drift.1149
  br label %then91_end
then91_end:
  br label %endif91
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t1510 = phi i64 [ 0, %then91_end ], [ 0, %else91_end ]
  %t1511 = load i64, ptr %local.early_drift.1148
  %t1512 = load i64, ptr %local.late_drift.1149
  %t1513 = call i64 @"s_score"(i64 %t1511, i64 %t1512)
  store i64 %t1513, ptr %local.ss.1170
  %t1514 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.228)
  %t1515 = ptrtoint ptr %t1514 to i64
  %t1516 = inttoptr i64 %t1515 to ptr
  call void @intrinsic_print(ptr %t1516)
  %t1517 = load i64, ptr %local.ss.1170
  %t1518 = call i64 @"print_f64"(i64 %t1517)
  %t1519 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.229)
  %t1520 = ptrtoint ptr %t1519 to i64
  %t1521 = inttoptr i64 %t1520 to ptr
  call void @intrinsic_println(ptr %t1521)
  %t1522 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.230)
  %t1523 = ptrtoint ptr %t1522 to i64
  %t1524 = inttoptr i64 %t1523 to ptr
  call void @intrinsic_println(ptr %t1524)
  ret i64 0
}

define i64 @"test_comparison"() nounwind {
entry:
  %t1525 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.231)
  %t1526 = ptrtoint ptr %t1525 to i64
  %t1527 = inttoptr i64 %t1526 to ptr
  call void @intrinsic_println(ptr %t1527)
  %t1528 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.232)
  %t1529 = ptrtoint ptr %t1528 to i64
  %t1530 = inttoptr i64 %t1529 to ptr
  call void @intrinsic_println(ptr %t1530)
  %t1531 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.233)
  %t1532 = call i64 @"run_comparison"(i64 %t1531, i64 1)
  %t1533 = call i64 @f64_parse(ptr @.str.exp_navier_stokes.234)
  %t1534 = call i64 @"run_comparison"(i64 %t1533, i64 0)
  %t1535 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.235)
  %t1536 = ptrtoint ptr %t1535 to i64
  %t1537 = inttoptr i64 %t1536 to ptr
  call void @intrinsic_println(ptr %t1537)
  %t1538 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.236)
  %t1539 = ptrtoint ptr %t1538 to i64
  %t1540 = inttoptr i64 %t1539 to ptr
  call void @intrinsic_println(ptr %t1540)
  %t1541 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.237)
  %t1542 = ptrtoint ptr %t1541 to i64
  %t1543 = inttoptr i64 %t1542 to ptr
  call void @intrinsic_println(ptr %t1543)
  %t1544 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.238)
  %t1545 = ptrtoint ptr %t1544 to i64
  %t1546 = inttoptr i64 %t1545 to ptr
  call void @intrinsic_println(ptr %t1546)
  %t1547 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.239)
  %t1548 = ptrtoint ptr %t1547 to i64
  %t1549 = inttoptr i64 %t1548 to ptr
  call void @intrinsic_println(ptr %t1549)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1550 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.240)
  %t1551 = ptrtoint ptr %t1550 to i64
  %t1552 = inttoptr i64 %t1551 to ptr
  call void @intrinsic_println(ptr %t1552)
  %t1553 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.241)
  %t1554 = ptrtoint ptr %t1553 to i64
  %t1555 = inttoptr i64 %t1554 to ptr
  call void @intrinsic_println(ptr %t1555)
  %t1556 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.242)
  %t1557 = ptrtoint ptr %t1556 to i64
  %t1558 = inttoptr i64 %t1557 to ptr
  call void @intrinsic_println(ptr %t1558)
  %t1559 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.243)
  %t1560 = ptrtoint ptr %t1559 to i64
  %t1561 = inttoptr i64 %t1560 to ptr
  call void @intrinsic_println(ptr %t1561)
  %t1562 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.244)
  %t1563 = ptrtoint ptr %t1562 to i64
  %t1564 = inttoptr i64 %t1563 to ptr
  call void @intrinsic_println(ptr %t1564)
  %t1565 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.245)
  %t1566 = ptrtoint ptr %t1565 to i64
  %t1567 = inttoptr i64 %t1566 to ptr
  call void @intrinsic_println(ptr %t1567)
  %t1568 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.246)
  %t1569 = ptrtoint ptr %t1568 to i64
  %t1570 = inttoptr i64 %t1569 to ptr
  call void @intrinsic_println(ptr %t1570)
  %t1571 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.247)
  %t1572 = ptrtoint ptr %t1571 to i64
  %t1573 = inttoptr i64 %t1572 to ptr
  call void @intrinsic_println(ptr %t1573)
  %t1574 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.248)
  %t1575 = ptrtoint ptr %t1574 to i64
  %t1576 = inttoptr i64 %t1575 to ptr
  call void @intrinsic_println(ptr %t1576)
  %t1577 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.249)
  %t1578 = ptrtoint ptr %t1577 to i64
  %t1579 = inttoptr i64 %t1578 to ptr
  call void @intrinsic_println(ptr %t1579)
  %t1580 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.250)
  %t1581 = ptrtoint ptr %t1580 to i64
  %t1582 = inttoptr i64 %t1581 to ptr
  call void @intrinsic_println(ptr %t1582)
  %t1583 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.251)
  %t1584 = ptrtoint ptr %t1583 to i64
  %t1585 = inttoptr i64 %t1584 to ptr
  call void @intrinsic_println(ptr %t1585)
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.252)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_println(ptr %t1588)
  %t1589 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.253)
  %t1590 = ptrtoint ptr %t1589 to i64
  %t1591 = inttoptr i64 %t1590 to ptr
  call void @intrinsic_println(ptr %t1591)
  %t1592 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.254)
  %t1593 = ptrtoint ptr %t1592 to i64
  %t1594 = inttoptr i64 %t1593 to ptr
  call void @intrinsic_println(ptr %t1594)
  %t1595 = call i64 @"test_viscosity_sweep"()
  %t1596 = call i64 @"test_reynolds"()
  %t1597 = call i64 @"test_blowup_detection"()
  %t1598 = call i64 @"test_comparison"()
  %t1599 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.255)
  %t1600 = ptrtoint ptr %t1599 to i64
  %t1601 = inttoptr i64 %t1600 to ptr
  call void @intrinsic_println(ptr %t1601)
  %t1602 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.256)
  %t1603 = ptrtoint ptr %t1602 to i64
  %t1604 = inttoptr i64 %t1603 to ptr
  call void @intrinsic_println(ptr %t1604)
  %t1605 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.257)
  %t1606 = ptrtoint ptr %t1605 to i64
  %t1607 = inttoptr i64 %t1606 to ptr
  call void @intrinsic_println(ptr %t1607)
  %t1608 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.258)
  %t1609 = ptrtoint ptr %t1608 to i64
  %t1610 = inttoptr i64 %t1609 to ptr
  call void @intrinsic_println(ptr %t1610)
  %t1611 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.259)
  %t1612 = ptrtoint ptr %t1611 to i64
  %t1613 = inttoptr i64 %t1612 to ptr
  call void @intrinsic_println(ptr %t1613)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.260)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_println(ptr %t1616)
  %t1617 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.261)
  %t1618 = ptrtoint ptr %t1617 to i64
  %t1619 = inttoptr i64 %t1618 to ptr
  call void @intrinsic_println(ptr %t1619)
  %t1620 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.262)
  %t1621 = ptrtoint ptr %t1620 to i64
  %t1622 = inttoptr i64 %t1621 to ptr
  call void @intrinsic_println(ptr %t1622)
  %t1623 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.263)
  %t1624 = ptrtoint ptr %t1623 to i64
  %t1625 = inttoptr i64 %t1624 to ptr
  call void @intrinsic_println(ptr %t1625)
  %t1626 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.264)
  %t1627 = ptrtoint ptr %t1626 to i64
  %t1628 = inttoptr i64 %t1627 to ptr
  call void @intrinsic_println(ptr %t1628)
  %t1629 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.265)
  %t1630 = ptrtoint ptr %t1629 to i64
  %t1631 = inttoptr i64 %t1630 to ptr
  call void @intrinsic_println(ptr %t1631)
  %t1632 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.266)
  %t1633 = ptrtoint ptr %t1632 to i64
  %t1634 = inttoptr i64 %t1633 to ptr
  call void @intrinsic_println(ptr %t1634)
  %t1635 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.267)
  %t1636 = ptrtoint ptr %t1635 to i64
  %t1637 = inttoptr i64 %t1636 to ptr
  call void @intrinsic_println(ptr %t1637)
  %t1638 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.268)
  %t1639 = ptrtoint ptr %t1638 to i64
  %t1640 = inttoptr i64 %t1639 to ptr
  call void @intrinsic_println(ptr %t1640)
  %t1641 = call ptr @intrinsic_string_new(ptr @.str.exp_navier_stokes.269)
  %t1642 = ptrtoint ptr %t1641 to i64
  %t1643 = inttoptr i64 %t1642 to ptr
  call void @intrinsic_println(ptr %t1643)
  ret i64 0
}


; String constants
@.str.exp_navier_stokes.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.2 = private unnamed_addr constant [23 x i8] c"3.14159265358979323846\00"
@.str.exp_navier_stokes.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_navier_stokes.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_navier_stokes.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_navier_stokes.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_navier_stokes.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_navier_stokes.9 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_navier_stokes.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.11 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_navier_stokes.12 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_navier_stokes.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.17 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_navier_stokes.18 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_navier_stokes.19 = private unnamed_addr constant [5 x i8] c"0.40\00"
@.str.exp_navier_stokes.20 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_navier_stokes.21 = private unnamed_addr constant [5 x i8] c"0.50\00"
@.str.exp_navier_stokes.22 = private unnamed_addr constant [5 x i8] c"0.55\00"
@.str.exp_navier_stokes.23 = private unnamed_addr constant [5 x i8] c"0.60\00"
@.str.exp_navier_stokes.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.28 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.29 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.30 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.31 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.32 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.33 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.34 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.35 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.36 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.37 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.38 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.39 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.40 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.41 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.42 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.43 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.44 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.45 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.46 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.47 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.49 = private unnamed_addr constant [55 x i8] c"--- Exp 1: I-ratio vs Viscosity (Burgers Equation) ---\00"
@.str.exp_navier_stokes.50 = private unnamed_addr constant [56 x i8] c"  du/dt + u*du/dx = nu * d2u/dx2,  u(x,0) = sin(2*pi*x)\00"
@.str.exp_navier_stokes.51 = private unnamed_addr constant [56 x i8] c"  High nu => diffusion dominates => laminar => I ~ -0.5\00"
@.str.exp_navier_stokes.52 = private unnamed_addr constant [59 x i8] c"  Low nu  => advection dominates => turbulent => I departs\00"
@.str.exp_navier_stokes.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.54 = private unnamed_addr constant [52 x i8] c"  nu        I_ratio     S_score     max|u|    Class\00"
@.str.exp_navier_stokes.55 = private unnamed_addr constant [57 x i8] c"  ------    --------    --------    ------    ----------\00"
@.str.exp_navier_stokes.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.57 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_navier_stokes.58 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_navier_stokes.59 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_navier_stokes.60 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_navier_stokes.61 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_navier_stokes.62 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_navier_stokes.63 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_navier_stokes.64 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.65 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_navier_stokes.66 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.67 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.68 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.69 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.70 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_navier_stokes.71 = private unnamed_addr constant [12 x i8] c"    LAMINAR\00"
@.str.exp_navier_stokes.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.73 = private unnamed_addr constant [24 x i8] c"    TURBULENT (blow-up)\00"
@.str.exp_navier_stokes.74 = private unnamed_addr constant [17 x i8] c"    TRANSITIONAL\00"
@.str.exp_navier_stokes.75 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.76 = private unnamed_addr constant [57 x i8] c"  FINDING: I-ratio departs from -0.5 as viscosity drops,\00"
@.str.exp_navier_stokes.77 = private unnamed_addr constant [48 x i8] c"  tracking the laminar-to-turbulent transition.\00"
@.str.exp_navier_stokes.78 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.79 = private unnamed_addr constant [42 x i8] c"--- Exp 2: I-ratio vs Reynolds Number ---\00"
@.str.exp_navier_stokes.80 = private unnamed_addr constant [46 x i8] c"  Re = U*L/nu = 1/nu (U=1, L=1 for our setup)\00"
@.str.exp_navier_stokes.81 = private unnamed_addr constant [47 x i8] c"  Track where I_ratio departs from equilibrium\00"
@.str.exp_navier_stokes.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.83 = private unnamed_addr constant [43 x i8] c"  Re        nu          I_ratio     Regime\00"
@.str.exp_navier_stokes.84 = private unnamed_addr constant [47 x i8] c"  ------    --------    --------    ----------\00"
@.str.exp_navier_stokes.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.86 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.87 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_navier_stokes.88 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_navier_stokes.89 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_navier_stokes.90 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_navier_stokes.91 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_navier_stokes.92 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_navier_stokes.93 = private unnamed_addr constant [6 x i8] c"0.003\00"
@.str.exp_navier_stokes.94 = private unnamed_addr constant [6 x i8] c"0.002\00"
@.str.exp_navier_stokes.95 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_navier_stokes.96 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.97 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_navier_stokes.98 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.99 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.100 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.101 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_navier_stokes.102 = private unnamed_addr constant [12 x i8] c"    LAMINAR\00"
@.str.exp_navier_stokes.103 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.104 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_navier_stokes.105 = private unnamed_addr constant [33 x i8] c"    TRANSITION  <-- critical Re?\00"
@.str.exp_navier_stokes.106 = private unnamed_addr constant [14 x i8] c"    TURBULENT\00"
@.str.exp_navier_stokes.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.108 = private unnamed_addr constant [57 x i8] c"  FINDING: The Reynolds number where I departs from -0.5\00"
@.str.exp_navier_stokes.109 = private unnamed_addr constant [51 x i8] c"  marks the laminar -> turbulent transition point.\00"
@.str.exp_navier_stokes.110 = private unnamed_addr constant [56 x i8] c"  I-ratio provides a gradient-based Re-like diagnostic.\00"
@.str.exp_navier_stokes.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.112 = private unnamed_addr constant [43 x i8] c"--- Exp 3: S Score as Blow-up Detector ---\00"
@.str.exp_navier_stokes.113 = private unnamed_addr constant [50 x i8] c"  nu = 0.001 (near-inviscid). Track S in windows.\00"
@.str.exp_navier_stokes.114 = private unnamed_addr constant [54 x i8] c"  Question: does S predict blow-up BEFORE it happens?\00"
@.str.exp_navier_stokes.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.116 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_navier_stokes.117 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_navier_stokes.118 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_navier_stokes.119 = private unnamed_addr constant [5 x i8] c"0.40\00"
@.str.exp_navier_stokes.120 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_navier_stokes.121 = private unnamed_addr constant [5 x i8] c"0.50\00"
@.str.exp_navier_stokes.122 = private unnamed_addr constant [5 x i8] c"0.55\00"
@.str.exp_navier_stokes.123 = private unnamed_addr constant [5 x i8] c"0.60\00"
@.str.exp_navier_stokes.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.125 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.126 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.127 = private unnamed_addr constant [57 x i8] c"  step    |u_mid|      window_drift   S_local     Status\00"
@.str.exp_navier_stokes.128 = private unnamed_addr constant [59 x i8] c"  ----    --------     ------------   --------    --------\00"
@.str.exp_navier_stokes.129 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_navier_stokes.130 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.131 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_navier_stokes.132 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_navier_stokes.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.134 = private unnamed_addr constant [11 x i8] c"  200     \00"
@.str.exp_navier_stokes.135 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.136 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.137 = private unnamed_addr constant [10 x i8] c"    early\00"
@.str.exp_navier_stokes.138 = private unnamed_addr constant [11 x i8] c"  400     \00"
@.str.exp_navier_stokes.139 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.140 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.142 = private unnamed_addr constant [11 x i8] c"  600     \00"
@.str.exp_navier_stokes.143 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.144 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.146 = private unnamed_addr constant [11 x i8] c"  800     \00"
@.str.exp_navier_stokes.147 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.148 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.149 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.150 = private unnamed_addr constant [11 x i8] c"  1000    \00"
@.str.exp_navier_stokes.151 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.152 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.154 = private unnamed_addr constant [11 x i8] c"  1200    \00"
@.str.exp_navier_stokes.155 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.156 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.157 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.158 = private unnamed_addr constant [11 x i8] c"  1500    \00"
@.str.exp_navier_stokes.159 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.160 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.161 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.162 = private unnamed_addr constant [11 x i8] c"  1800    \00"
@.str.exp_navier_stokes.163 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.164 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.166 = private unnamed_addr constant [11 x i8] c"  2000    \00"
@.str.exp_navier_stokes.167 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_navier_stokes.168 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_navier_stokes.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.170 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.171 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.172 = private unnamed_addr constant [28 x i8] c"  S went negative at step: \00"
@.str.exp_navier_stokes.173 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.174 = private unnamed_addr constant [36 x i8] c"  S stayed non-negative throughout.\00"
@.str.exp_navier_stokes.175 = private unnamed_addr constant [29 x i8] c"  |u| exceeded 10 at step:  \00"
@.str.exp_navier_stokes.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.177 = private unnamed_addr constant [41 x i8] c"  No blow-up detected (|u| stayed < 10).\00"
@.str.exp_navier_stokes.178 = private unnamed_addr constant [48 x i8] c"  >> S predicted blow-up BEFORE it happened! <<\00"
@.str.exp_navier_stokes.179 = private unnamed_addr constant [47 x i8] c"  >> Blow-up and S-negative occurred together.\00"
@.str.exp_navier_stokes.180 = private unnamed_addr constant [54 x i8] c"  >> S detected instability; no full blow-up reached.\00"
@.str.exp_navier_stokes.181 = private unnamed_addr constant [50 x i8] c"  >> Solution remained stable at this resolution.\00"
@.str.exp_navier_stokes.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.183 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_navier_stokes.184 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_navier_stokes.185 = private unnamed_addr constant [5 x i8] c"0.40\00"
@.str.exp_navier_stokes.186 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_navier_stokes.187 = private unnamed_addr constant [5 x i8] c"0.50\00"
@.str.exp_navier_stokes.188 = private unnamed_addr constant [5 x i8] c"0.55\00"
@.str.exp_navier_stokes.189 = private unnamed_addr constant [5 x i8] c"0.60\00"
@.str.exp_navier_stokes.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.191 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_navier_stokes.192 = private unnamed_addr constant [16 x i8] c"  LAMINAR  (nu=\00"
@.str.exp_navier_stokes.193 = private unnamed_addr constant [16 x i8] c"  TURBLNT  (nu=\00"
@.str.exp_navier_stokes.194 = private unnamed_addr constant [3 x i8] c"):\00"
@.str.exp_navier_stokes.195 = private unnamed_addr constant [37 x i8] c"    step    |u_mid|    I_ratio(inst)\00"
@.str.exp_navier_stokes.196 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.197 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.198 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.199 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.200 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.201 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.202 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.203 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.204 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.205 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.206 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.207 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.208 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.209 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.210 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.211 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.212 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.213 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.214 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.215 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_navier_stokes.216 = private unnamed_addr constant [13 x i8] c"    0       \00"
@.str.exp_navier_stokes.217 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.218 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.219 = private unnamed_addr constant [13 x i8] c"    200     \00"
@.str.exp_navier_stokes.220 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.221 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.222 = private unnamed_addr constant [13 x i8] c"    500     \00"
@.str.exp_navier_stokes.223 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.224 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.225 = private unnamed_addr constant [13 x i8] c"    999     \00"
@.str.exp_navier_stokes.226 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_navier_stokes.227 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.228 = private unnamed_addr constant [15 x i8] c"    S_score = \00"
@.str.exp_navier_stokes.229 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.230 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.231 = private unnamed_addr constant [49 x i8] c"--- Exp 4: Laminar vs Turbulent Side-by-Side ---\00"
@.str.exp_navier_stokes.232 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.233 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_navier_stokes.234 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_navier_stokes.235 = private unnamed_addr constant [60 x i8] c"  FINDING: In the laminar case, I stays near -0.5 and S > 0\00"
@.str.exp_navier_stokes.236 = private unnamed_addr constant [61 x i8] c"  (forces balance, solution settles). In the turbulent case,\00"
@.str.exp_navier_stokes.237 = private unnamed_addr constant [56 x i8] c"  I departs from -0.5 and S drops (advection dominates,\00"
@.str.exp_navier_stokes.238 = private unnamed_addr constant [22 x i8] c"  solution steepens).\00"
@.str.exp_navier_stokes.239 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.240 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_navier_stokes.241 = private unnamed_addr constant [48 x i8] c"  NAVIER-STOKES DIAGNOSTIC: I-RATIO AND S SCORE\00"
@.str.exp_navier_stokes.242 = private unnamed_addr constant [37 x i8] c"  ON THE 1D VISCOUS BURGERS EQUATION\00"
@.str.exp_navier_stokes.243 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_navier_stokes.244 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.245 = private unnamed_addr constant [40 x i8] c"  Model: du/dt + u*du/dx = nu * d2u/dx2\00"
@.str.exp_navier_stokes.246 = private unnamed_addr constant [50 x i8] c"  This is the simplest Navier-Stokes-like system.\00"
@.str.exp_navier_stokes.247 = private unnamed_addr constant [59 x i8] c"  Two forces: advection (nonlinear) vs diffusion (linear).\00"
@.str.exp_navier_stokes.248 = private unnamed_addr constant [48 x i8] c"  I-ratio and S score diagnose the flow regime.\00"
@.str.exp_navier_stokes.249 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.250 = private unnamed_addr constant [56 x i8] c"  NOTE: Simplified 5-point stencil model. Real NS is 3D\00"
@.str.exp_navier_stokes.251 = private unnamed_addr constant [55 x i8] c"  with pressure, continuity, and boundary layers. This\00"
@.str.exp_navier_stokes.252 = private unnamed_addr constant [62 x i8] c"  experiment tests whether I and S provide useful diagnostics\00"
@.str.exp_navier_stokes.253 = private unnamed_addr constant [23 x i8] c"  on NS-LIKE dynamics.\00"
@.str.exp_navier_stokes.254 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.255 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_navier_stokes.256 = private unnamed_addr constant [15 x i8] c"  CONCLUSIONS:\00"
@.str.exp_navier_stokes.257 = private unnamed_addr constant [55 x i8] c"  1. I-ratio near -0.5 => advection/diffusion balanced\00"
@.str.exp_navier_stokes.258 = private unnamed_addr constant [45 x i8] c"     => LAMINAR flow (forces in equilibrium)\00"
@.str.exp_navier_stokes.259 = private unnamed_addr constant [56 x i8] c"  2. I-ratio departing from -0.5 => one force dominates\00"
@.str.exp_navier_stokes.260 = private unnamed_addr constant [49 x i8] c"     => TURBULENT transition (symmetry breaking)\00"
@.str.exp_navier_stokes.261 = private unnamed_addr constant [58 x i8] c"  3. S score tracks solution stability: S > 0 = settling,\00"
@.str.exp_navier_stokes.262 = private unnamed_addr constant [46 x i8] c"     S < 0 = steepening (pre-shock / blow-up)\00"
@.str.exp_navier_stokes.263 = private unnamed_addr constant [51 x i8] c"  4. The Reynolds number where I departs from -0.5\00"
@.str.exp_navier_stokes.264 = private unnamed_addr constant [55 x i8] c"     corresponds to the laminar->turbulent critical Re\00"
@.str.exp_navier_stokes.265 = private unnamed_addr constant [50 x i8] c"  5. S can detect instability BEFORE full blow-up\00"
@.str.exp_navier_stokes.266 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_navier_stokes.267 = private unnamed_addr constant [49 x i8] c"  The I-ratio theorem applies to fluid dynamics:\00"
@.str.exp_navier_stokes.268 = private unnamed_addr constant [44 x i8] c"  force balance (I = -0.5) IS laminar flow.\00"
@.str.exp_navier_stokes.269 = private unnamed_addr constant [61 x i8] c"============================================================\00"
